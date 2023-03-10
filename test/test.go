package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"github.com/xingyunyang01/genericOperator/pkg/controllers"
	"github.com/xingyunyang01/genericOperator/pkg/utils/helpers"
)

func main() {
	//相当于用户提交的cr
	g := &v1alpha1.Generic{
		Spec: v1alpha1.GenericSpec{
			Gvr: "v1/pods",
			Template: map[string]interface{}{
				"name":  "testpod",
				"image": "nginx:1.18-alpine",
			},
		},
	}

	//将Gvr转化成g_v_r.cue的格式
	cueName, cueFilePath := controllers.ConvertToCueFile(g.Spec.Gvr)

	//读取cue文件到instance
	inst := helpers.MustLoadFileInstance(cueFilePath)

	//根据Template里的值填充cue模板中的input部分
	filldCV := inst.FillPath(cue.ParsePath(cueName+"_input"),
		inst.Context().Encode(g.Spec.Template))

	//将模板中的g_v_r部分序列化成json
	jsonBytes, _ := filldCV.LookupPath(cue.ParsePath(cueName)).MarshalJSON()

	fmt.Println(string(jsonBytes))
}
