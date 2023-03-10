package spark

sparkOperatorDeploy: {
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
        "name": "sparkoperator",
        "namespace": "spark-operator",
        "labels": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
        }
    },
    "spec": {
        "replicas": 1,
        "selector": {
            "matchLabels": {
                "app.kubernetes.io/name": "sparkoperator",
                "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
            }
        },
        "strategy": {
            "type": "Recreate"
        },
        "template": {
            "metadata": {
                "labels": {
                    "app.kubernetes.io/name": "sparkoperator",
                    "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
                }
            },
            "spec": {
                "serviceAccountName": "sparkoperator",
                "containers": [
                    {
                        "name": "sparkoperator",
                        "image": "gcr.io/spark-operator/spark-operator:v1beta2-1.3.0-3.1.1",
                        "imagePullPolicy": "Always",
                        "args": [
                            "-logtostderr"
                        ]
                    }
                ]
            }
        }
    }
}