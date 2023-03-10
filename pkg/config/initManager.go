package config

import (
	"log"
	"os"

	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"github.com/xingyunyang01/genericOperator/pkg/controllers"
	"github.com/xingyunyang01/genericOperator/pkg/utils/helpers"
	"github.com/xingyunyang01/genericOperator/pkg/vars"
	"sigs.k8s.io/controller-runtime/pkg/builder"
	"sigs.k8s.io/controller-runtime/pkg/client"
	logf "sigs.k8s.io/controller-runtime/pkg/log"
	"sigs.k8s.io/controller-runtime/pkg/log/zap"
	"sigs.k8s.io/controller-runtime/pkg/manager"
	"sigs.k8s.io/controller-runtime/pkg/manager/signals"
)

// 初始化 控制器管理器
func InitManager() {

	logf.SetLogger(zap.New())
	mgr, err := manager.New(NewK8sConfig().K8sRestConfig(),
		manager.Options{
			Logger: logf.Log.WithName("gr"),
		})
	if err != nil {
		log.Fatal("创建管理器失败:", err.Error())
	}

	vars.GlobalClient = mgr.GetClient()
	// 这里要对 Restmapping 和 config赋值  。 方便其他地方调用
	vars.K8sRestMapper = mgr.GetRESTMapper()
	vars.RestConfig = mgr.GetConfig()
	vars.GlobalScheme = mgr.GetScheme() // 保存Scheme 到全局对象

	//Schema定义了资源序列化和反序列化的方法以及资源类型和版本的对应关系
	err = v1alpha1.SchemeBuilder.AddToScheme(mgr.GetScheme())
	if err != nil {
		mgr.GetLogger().Error(err, "unable add schema")
		os.Exit(1)
	}
	//初始化控制器对象
	genericCtl := controllers.NewGenericController(
		mgr.GetEventRecorderFor("gr"),
	)
	// 第一章的单资源模式
	//ownsObjects := helpers.ScanTplFileToObjects()

	// 多资源
	ownsObjects := helpers.ScanToObjects()

	bdr := builder.ControllerManagedBy(mgr).
		For(&v1alpha1.Generic{})
	for _, obj := range ownsObjects {
		bdr = bdr.Owns(obj.(client.Object))
	}

	if err = bdr.Complete(genericCtl); err != nil {
		mgr.GetLogger().Error(err, "unable to create manager")
		os.Exit(1)
	}

	//if err = builder.ControllerManagedBy(mgr).
	//	For(&v1alpha1.Generic{}).
	//	Complete(genericCtl); err != nil {
	//	mgr.GetLogger().Error(err, "unable to create manager")
	//	os.Exit(1)
	//}

	if err = mgr.Start(signals.SetupSignalHandler()); err != nil {
		mgr.GetLogger().Error(err, "unable to start manager")
	}
}
