package flowhandlers

import (
	"github.com/tidwall/gjson"
	"k8s.io/apimachinery/pkg/util/json"
	"k8s.io/cli-runtime/pkg/resource"
)

// 处理状态 用的 Struct
type Status struct {
	Expr   string      `json:"expr"`   //cue模板中的expr
	Key    string      `json:"key"`    //cue模板中的key
	CrName string      `json:"crname"` //cue模板中的crname
	Value  interface{} `json:"value"`
}

func (s *Status) Parse(info *resource.Info) error {
	//将资源序列化成json
	b, err := json.Marshal(info.Object)
	if err != nil {
		return err
	}

	//从b中查找是否有expr对应的字段，如果有，取出该字段的值存入到value
	if v := gjson.Get(string(b), s.Expr); v.Exists() {
		s.Value = v.Value()
	} else {
		return nil
	}
	return nil

}
