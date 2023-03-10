package vars

import (
	"k8s.io/apimachinery/pkg/api/meta"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/client-go/rest"
	"sigs.k8s.io/controller-runtime/pkg/client"
)

// 模板根目录
const CueTplRoot = "./resources/tpls"

var GlobalClient client.Client // 全局 client 。创建manager 后赋值

var (
	K8sRestMapper meta.RESTMapper
	RestConfig    *rest.Config
	GlobalScheme  *runtime.Scheme
)
