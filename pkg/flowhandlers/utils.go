package flowhandlers

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/tools/flow"
	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"github.com/xingyunyang01/genericOperator/pkg/vars"
	"k8s.io/apimachinery/pkg/types"
)

// 委托运行， 默认都是POST
func delegatePost(url string, param map[string]string) error {
	bodyJSON, _ := json.Marshal(param)
	req, err := http.NewRequest("POST", url, bytes.NewReader(bodyJSON))
	if err != nil {
		return err
	}
	rsp, err := http.DefaultClient.Do(req)
	if err != nil {
		return err
	}
	defer rsp.Body.Close()
	rspString, err := ioutil.ReadAll(rsp.Body)
	if err != nil {
		return err
	}
	if rsp.StatusCode >= 400 {
		return fmt.Errorf(string(rspString))
	}
	return nil
}

// 判断是否存在某个 Field
func existField(value cue.Value, field string) bool {
	f := value.Value().LookupPath(cue.ParsePath(field))
	return f.Exists()
}

// 获取status对象，如果取不到返回nil
func getStatus(value cue.Value) *Status {
	//查找cue模板中是否有status字段
	f := value.Value().LookupPath(cue.ParsePath("status"))
	status := &Status{}
	if f.Exists() { //如果有, 将其映射成Status结构体
		if err := f.Decode(status); err != nil {
			fmt.Println(err)
			return nil
		}
		return status
	}
	return nil
}

// 获取cue里面的值 ，必须传默认值   如果没有找到或出错，铁定会返回 默认值
func getField(value cue.Value, field string, defaultValue string) string {
	f := value.Value().LookupPath(cue.ParsePath(field))
	if !f.Exists() {
		return defaultValue
	}
	ret, err := f.String() //必须是string
	if err != nil {
		return defaultValue
	}
	return ret
}

// 获取 Generic母对象  ,,
func getGenericObject(value cue.Value, field string) *v1alpha1.Generic {
	var nameStr, nsStr = "", "default"
	// 其实只要取 name和namesapce 就行了 ---- 注意;他们在 metadata里 。
	name := value.LookupPath(cue.ParsePath(field + ".metadata.name"))
	if !name.Exists() {
		fmt.Println("no name") //名称必须有
		return nil
	}
	nameStr, _ = name.String()
	ns := value.LookupPath(cue.ParsePath(field + ".metadata.namespace"))
	if ns.Exists() { //如果不存在 ，则默认就是default
		nsStr, _ = ns.String()
	}

	generic := &v1alpha1.Generic{}
	err := vars.GlobalClient.Get(context.Background(), types.NamespacedName{
		Name: nameStr, Namespace: nsStr,
	}, generic)
	if err != nil {
		return nil
	}
	return generic
}

func jsonField(v cue.Value, field string) ([]byte, error) {
	p := v.LookupPath(cue.ParsePath("body"))
	if !p.Exists() {
		return nil, fmt.Errorf("not found field:%s", field)
	}
	return p.MarshalJSON()
}

func NewFlowFunc(tplPath, root string, taskFunc flow.TaskFunc) func(params string) *flow.Controller {
	return func(params string) *flow.Controller {
		//将cue模板导入成instance
		inst := load.Instances([]string{tplPath}, nil)[0]
		cc := cuecontext.New()
		cv := cc.BuildInstance(inst)
		if cv.Err() != nil {
			panic(cv.Err().Error())
		}

		filledCv := cv // 冗余cv 为了下面 如果有parmas 进行覆盖

		//解析参数
		if strings.Trim(params, " ") != "" {
			pv := cc.CompileString(params)
			if pv.Err() != nil {
				panic(pv.Err().Error())
			}

			if fields, err := pv.Fields(); err == nil {
				for fields.Next() {
					fillPath := cue.ParsePath(root + "." + fields.Label())

					if !cv.LookupPath(fillPath).Exists() {
						continue
					}
					filledCv = filledCv.FillPath(fillPath, fields.Value())
					if filledCv.Err() != nil {
						panic(filledCv.Err())
					}
				}
			}
		}

		return flow.New(&flow.Config{Root: cue.ParsePath(root)},
			filledCv, taskFunc)
	}
}

func NewFlowFuncWithCue(cv cue.Value, root string, taskFunc flow.TaskFunc) func(params string) *flow.Controller {
	return func(params string) *flow.Controller {
		cc := cv.Context()
		filledCv := cv // 冗余cv 为了下面 如果有parmas 进行覆盖

		//解析参数
		if strings.Trim(params, " ") != "" {
			pv := cc.CompileString(params)
			if pv.Err() != nil {
				panic(pv.Err().Error())
			}

			if fields, err := pv.Fields(); err == nil {
				for fields.Next() {
					fillPath := cue.ParsePath(root + "." + fields.Label())

					if !cv.LookupPath(fillPath).Exists() {
						continue
					}
					filledCv = filledCv.FillPath(fillPath, fields.Value())
					if filledCv.Err() != nil {
						panic(filledCv.Err())
					}
				}
			}
		}

		return flow.New(&flow.Config{Root: cue.ParsePath(root)},
			filledCv, taskFunc)
	}
}
