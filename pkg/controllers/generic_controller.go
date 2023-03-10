package controllers

import (
	"context"

	"github.com/xingyunyang01/genericOperator/pkg/apis/generic/v1alpha1"
	"k8s.io/apimachinery/pkg/api/errors"
	"k8s.io/client-go/tools/record"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/reconcile"
)

type GenericController struct {
	client.Client
	E record.EventRecorder //记录事件
}

func NewGenericController(e record.EventRecorder) *GenericController {
	return &GenericController{E: e}
}

func (r *GenericController) Reconcile(ctx context.Context, req reconcile.Request) (reconcile.Result, error) {
	g := &v1alpha1.Generic{}
	err := r.Get(ctx, req.NamespacedName, g)
	if err != nil {
		if errors.IsNotFound(err) {
			return reconcile.Result{}, nil
		}
		return reconcile.Result{}, err
	}

	if g.Status == nil {
		g.Status = make(v1alpha1.StatusTemplate)
	}

	err = apply(g)
	if err != nil {
		return reconcile.Result{}, err
	}

	err = r.Client.Status().Update(ctx, g)
	if err != nil {
		return reconcile.Result{}, err
	}

	return reconcile.Result{}, nil
}

func (r *GenericController) InjectClient(c client.Client) error {
	r.Client = c
	return nil
}
