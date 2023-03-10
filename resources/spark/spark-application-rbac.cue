package spark

sparkNs: {
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
        "name": "spark"
    }
}

sparkSa: {
    "apiVersion": "v1",
    "kind": "ServiceAccount",
    "metadata": {
        "name": "spark",
        "namespace": "spark"
    }
}

sparkRole: {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "Role",
    "metadata": {
        "namespace": "spark",
        "name": "spark-role"
    },
    "rules": [
        {
            "apiGroups": [
                ""
            ],
            "resources": [
                "pods"
            ],
            "verbs": [
                "*"
            ]
        },
        {
            "apiGroups": [
                ""
            ],
            "resources": [
                "services"
            ],
            "verbs": [
                "*"
            ]
        }
    ]
}

sparkRoleBinding: {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "RoleBinding",
    "metadata": {
        "name": "spark-role-binding",
        "namespace": "spark"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "spark",
            "namespace": "spark"
        }
    ],
    "roleRef": {
        "kind": "Role",
        "name": "spark-role",
        "apiGroup": "rbac.authorization.k8s.io"
    }
}

