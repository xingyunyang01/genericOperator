package spark

deployment: {
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {
        "name": "sparkoperator",
        "namespace": "spark-operator",
        "labels": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v2.4.0-v1beta1"
        }
    },
    "spec": {
        "replicas": 1,
        "selector": {
            "matchLabels": {
                "app.kubernetes.io/name": "sparkoperator",
                "app.kubernetes.io/version": "v2.4.0-v1beta1"
            }
        },
        "strategy": {
            "type": "Recreate"
        },
        "template": {
            "metadata": {
                "labels": {
                    "app.kubernetes.io/name": "sparkoperator",
                    "app.kubernetes.io/version": "v2.4.0-v1beta1"
                },
                "initializers": {
                    "pending": []
                }
            },
            "spec": {
                "serviceAccountName": "sparkoperator",
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
                        "image": "gcr.io/spark-operator/spark-operator:v2.4.0-v1beta1-latest",
                        "imagePullPolicy": "Always",
                        "volumeMounts": [
                            {
                                "name": "webhook-certs",
                                "mountPath": "/etc/webhook-certs"
                            }
                        ],
                        "ports": [
                            {
                                "containerPort": 8080
                            }
                        ],
                        "args": [
                            "-logtostderr",
                            "-enable-webhook=true",
                            "-v=2"
                        ]
                    }
                ]
            }
        }
    }
}

job: {
    "apiVersion": "batch/v1",
    "kind": "Job",
    "metadata": {
        "name": "sparkoperator-init",
        "namespace": "spark-operator",
        "labels": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v2.4.0-v1beta1"
        }
    },
    "spec": {
        "backoffLimit": 3,
        "template": {
            "metadata": {
                "labels": {
                    "app.kubernetes.io/name": "sparkoperator",
                    "app.kubernetes.io/version": "v2.4.0-v1beta1"
                }
            },
            "spec": {
                "serviceAccountName": "sparkoperator",
                "restartPolicy": "Never",
                "containers": [
                    {
                        "name": "main",
                        "image": "gcr.io/spark-operator/spark-operator:v2.4.0-v1beta1-latest",
                        "imagePullPolicy": "IfNotPresent",
                        "command": [
                            "/usr/bin/gencerts.sh",
                            "-p"
                        ]
                    }
                ]
            }
        }
    }
}

service: {
    "kind": "Service",
    "apiVersion": "v1",
    "metadata": {
        "name": "spark-webhook",
        "namespace": "spark-operator"
    },
    "spec": {
        "ports": [
            {
                "port": 443,
                "targetPort": 8080,
                "name": "webhook"
            }
        ],
        "selector": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v2.4.0-v1beta1"
        }
    }
}