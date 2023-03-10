package spark

deployment: {
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
        "name": "sparkoperator",
        "labels": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
        },
        "namespace": "spark-operator"
    },
    "spec": {
        "template": {
            "spec": {
                "volumes": [
                    {
                        "name": "webhook-certs",
                        "secret": {
                            "secretName": "spark-webhook-certs"
                        }
                    }
                ],
                "containers": [
                    {
                        "name": "sparkoperator",
                        "args": [
                            "-logtostderr",
                            "-enable-webhook=true",
                            "-v=2"
                        ],
                        "volumeMounts": [
                            {
                                "name": "webhook-certs",
                                "mountPath": "/etc/webhook-certs"
                            }
                        ]
                    }
                ]
            }
        }
    }
}