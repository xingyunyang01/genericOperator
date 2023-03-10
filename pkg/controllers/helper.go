package controllers

import (
	"context"
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/pkg/strings"
	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"github.com/xingyunyang01/genericOperator/pkg/flowhandlers"
	"github.com/xingyunyang01/genericOperator/pkg/utils/helpers"
	"github.com/xingyunyang01/genericOperator/pkg/vars"
)

// 这些符号 一律要替换成 _
var replaces = []string{
	"\\", "/", ".",
}

const CueTplRoot = "./resources/tpls"

// v1/pods 或  apps/v1/deployments    v1.pods  v1\pods v1/pods
func ConvertToCueFile(gvr string) (string, string) {
	//  替换v1_pods     apps_v1_deployments
	for _, r := range replaces {
		gvr = strings.Replace(gvr, r, "_", -1)
	}
	var cuePath string
	gvrList := strings.Split(gvr, "_")

	if len(gvrList) == 2 { // core的情况
		cuePath = fmt.Sprintf("core_%s_%s", gvrList[0], gvrList[1])
	} else if len(gvrList) == 3 {
		cuePath = fmt.Sprintf("%s_%s_%s", gvrList[0], gvrList[1], gvrList[2])
	}
	return cuePath, fmt.Sprintf("%s/%s.cue", CueTplRoot, cuePath)
}

// 判断workflow字段是否存在，以及 值是否是true
func isWorkFlow(v cue.Value) bool {
	v = v.LookupPath(cue.ParsePath("isworkflow")) //取出cue模板中的isworkflow
	if v.Err() == nil && v.Exists() {
		if vb, ok := v.Bool(); ok == nil && vb {
			return true
		}
	}
	return false
}

func apply(g *v1alpha1.Generic) error {
	//将Gvr转化成g_v_r.cue的格式
	cueName, cueFile := ConvertToCueFile(g.Spec.Gvr)
	if cueName == "" || cueFile == "" {
		return fmt.Errorf("错误的gvr或配置")
	}

	//读取cue文件到instance
	inst := helpers.MustLoadFileInstance(cueFile)

	//根据Template里的值填充cue模板中的generic和input部分
	filldCV := inst.Fill(map[string]interface{}{
		"generic":          inst.Context().Encode(g),
		cueName + "_input": inst.Context().Encode(g.Spec.Template),
	})
	if filldCV.Err() != nil {
		return filldCV.Err()
	}

	//这一步开始判断是否是 工作流模式，如果是 处理方式不同
	if isWorkFlow(filldCV) {
		fmt.Println("进入工作流模式")

		flow := flowhandlers.NewFlowFuncWithCue(filldCV, "workflow", flowhandlers.K8sFLowHandler)("")
		err := flow.Run(context.Background())
		if err != nil {
			return err
		}
	}

	//将模板中的g_v_r部分序列化成json
	jsonBytes, err := filldCV.LookupPath(cue.ParsePath(cueName)).MarshalJSON()
	if err != nil {
		return err
	}

	//kubectl apply
	_, err = helpers.K8sApply(jsonBytes, vars.RestConfig, vars.K8sRestMapper)
	if err != nil {
		return err
	}

	return nil
}
