package spark

job: {
    "apiVersion": "batch/v1",
    "kind": "Job",
    "metadata": {
        "name": "sparkoperator-init",
        "namespace": "spark-operator",
        "labels": {
            "app.kubernetes.io/name": "sparkoperator",
            "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
        }
    },
    "spec": {
        "backoffLimit": 3,
        "template": {
            "metadata": {
                "labels": {
                    "app.kubernetes.io/name": "sparkoperator",
                    "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
                }
            },
            "spec": {
                "serviceAccountName": "sparkoperator",
                "restartPolicy": "Never",
                "containers": [
                    {
                        "name": "main",
                        "image": "gcr.io/spark-operator/spark-operator:v1beta2-1.3.0-3.1.1",
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
            "app.kubernetes.io/version": "v1beta2-1.3.0-3.1.1"
        }
    }
}