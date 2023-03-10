package helpers

import (
	"log"
	"os"
	"path/filepath"
	"reflect"
	"strings"

	"cuelang.org/go/cue"
	"github.com/xingyunyang01/genericOperator/pkg/vars"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/runtime/schema"
)

func getGVKFromBody(body cue.Value) schema.GroupVersionKind {
	gvk := schema.GroupVersionKind{}
	apiversion, err := body.LookupPath(cue.ParsePath("apiVersion")).String()
	if err != nil {
		return gvk
	}
	kind, err := body.LookupPath(cue.ParsePath("kind")).String()
	if err != nil {
		return gvk
	}
	fList := strings.Split(apiversion, "/")
	if len(fList) == 1 {
		gvk.Version = fList[0]
		gvk.Kind = kind // 一定要在这设置
		return gvk
	} else if len(fList) == 2 {
		gvk.Group = fList[0]
		gvk.Version = fList[1]
		gvk.Kind = kind
		return gvk
	} else {
		return gvk
	}
}

// 支持多资源的扫描函数
func ScanTplFileToGvks() []schema.GroupVersionKind {
	ret := []schema.GroupVersionKind{}
	_ = filepath.Walk(vars.CueTplRoot, func(path string, info os.FileInfo, err error) error {
		if !info.IsDir() && filepath.Ext(info.Name()) == ".cue" {
			cv := MustLoadFileInstance(vars.CueTplRoot + "/" + info.Name())
			if cv.Err() != nil {
				log.Println(cv.Err())
				return cv.Err()
			}
			//查询出所有节点
			flowNodes := cv.LookupPath(cue.ParsePath("workflow"))
			if !flowNodes.Exists() {
				return nil
			}
			fs, err := flowNodes.Fields()
			if err != nil {
				return err
			}
			for fs.Next() {
				body := fs.Value().LookupPath(cue.ParsePath("body"))
				if gvk := getGVKFromBody(body); !gvk.Empty() {
					ret = append(ret, gvk)
				}
			}
		}
		return nil
	})
	return ret

}

func ScanToObjects() []runtime.Object {
	gvks := ScanTplFileToGvks()
	objs := []runtime.Object{}
	allTypes := vars.GlobalScheme.AllKnownTypes()
	for k, t := range allTypes {
		for _, gvk := range gvks {
			if k == gvk {
				if obj, ok := reflect.New(t).Interface().(runtime.Object); ok {
					objs = append(objs, obj)
				}
			}
		}
	}
	return objs
}
