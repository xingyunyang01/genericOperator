package flowhandlers

import (
	"context"
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/tools/flow"
	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"github.com/xingyunyang01/genericOperator/pkg/utils/helpers"
	"github.com/xingyunyang01/genericOperator/pkg/vars"
)

// 纯为 k8s apply 所使用的handler ，其他功能到时候再扩展
func K8sFLowHandler(v cue.Value) (flow.Runner, error) {
	//获取节点名称
	l, b := v.Label()
	if !b || l == "workflow" { //如果是根节点，则返回空
		return nil, nil
	}

	//如果不是根节点，则开始执行工作流
	return flow.RunnerFunc(func(t *flow.Task) error {
		fmt.Println("当前的索引是: ", t.Index())
		for _, d := range t.Dependencies() {
			fmt.Println("依赖的索引是: ", d.Path())
		}
		fmt.Println("----------------------------------")
		//如果不是step0
		if t.Index() != 0 { //则取出body, body里放了cue模板, 将其转成json
			k8sJson, err := t.Value().LookupPath(cue.ParsePath("body")).MarshalJSON()
			if err != nil {
				return err
			}
			//取出action的值
			action := getField(t.Value(), "action", "apply")

			//如果是apply, 则安装
			if action == "apply" {
				fmt.Println(string(k8sJson))
				infos, err := helpers.K8sApply(k8sJson, vars.RestConfig, vars.K8sRestMapper)
				if err != nil {
					return err
				}

				//处理状态
				if status := getStatus(t.Value()); status != nil {
					//将status映射成Status结构体
					err = status.Parse(infos[0])
					if err != nil {
						return err
					}
					//判断上面的解析是否成功
					if status.Value != nil {
						if g := getGenericObject(t.Value(), status.CrName); g != nil {
							if g.Status == nil {
								g.Status = make(v1alpha1.StatusTemplate)
							}

							g.Status[status.Key] = status.Value

							err = vars.GlobalClient.Status().Update(context.Background(), g)
							if err != nil {
								return err
							}
						}
					}
				}
			} else { //如果是delete, 则删除
				err = helpers.K8sDelete(k8sJson, vars.RestConfig, vars.K8sRestMapper)
				if err != nil {
					return err
				}
			}
		}
		return nil
	}), nil
}
