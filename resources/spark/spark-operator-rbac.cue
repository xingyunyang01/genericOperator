package spark

ns: {
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
        "name": "spark-operator"
    }
}

ServiceAccount: {
    "apiVersion": "v1",
    "kind": "ServiceAccount",
    "metadata": {
        "name": "sparkoperator",
        "namespace": "spark-operator"
    }
}

ClusterRole: {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRole",
    "metadata": {
        "name": "sparkoperator"
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
                "configmaps"
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
                "services",
                "secrets"
            ],
            "verbs": [
                "create",
                "get",
                "delete"
            ]
        },
        {
            "apiGroups": [
                "extensions"
            ],
            "resources": [
                "ingresses"
            ],
            "verbs": [
                "create",
                "get",
                "delete"
            ]
        },
        {
            "apiGroups": [
                ""
            ],
            "resources": [
                "nodes"
            ],
            "verbs": [
                "get"
            ]
        },
        {
            "apiGroups": [
                ""
            ],
            "resources": [
                "resourcequotas"
            ],
            "verbs": [
                "get",
                "list",
                "watch"
            ]
        },
        {
            "apiGroups": [
                ""
            ],
            "resources": [
                "events"
            ],
            "verbs": [
                "create",
                "update",
                "patch"
            ]
        },
        {
            "apiGroups": [
                "apiextensions.k8s.io"
            ],
            "resources": [
                "customresourcedefinitions"
            ],
            "verbs": [
                "create",
                "get",
                "update",
                "delete"
            ]
        },
        {
            "apiGroups": [
                "admissionregistration.k8s.io"
            ],
            "resources": [
                "mutatingwebhookconfigurations",
                "validatingwebhookconfigurations"
            ],
            "verbs": [
                "create",
                "get",
                "update",
                "delete"
            ]
        },
        {
            "apiGroups": [
                "sparkoperator.k8s.io"
            ],
            "resources": [
                "sparkapplications",
                "scheduledsparkapplications",
                "sparkapplications/status",
                "scheduledsparkapplications/status"
            ],
            "verbs": [
                "*"
            ]
        },
        {
            "apiGroups": [
                "scheduling.volcano.sh"
            ],
            "resources": [
                "podgroups",
                "queues",
                "queues/status"
            ],
            "verbs": [
                "get",
                "list",
                "watch",
                "create",
                "delete",
                "update"
            ]
        }
    ]
}

ClusterRoleBinding: {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRoleBinding",
    "metadata": {
        "name": "sparkoperator"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "sparkoperator",
            "namespace": "spark-operator"
        }
    ],
    "roleRef": {
        "kind": "ClusterRole",
        "name": "sparkoperator",
        "apiGroup": "rbac.authorization.k8s.io"
    }
}

ClusterRole2: {
    "apiVersion": "rbac.authorization.k8s.io/v1",
    "kind": "ClusterRole",
    "metadata": {
        "labels": {
            "rbac.authorization.k8s.io/aggregate-to-admin": "true"
        },
        "name": "sparkoperator-aggregate-to-admin"
    },
    "rules": [
        {
            "apiGroups": [
                "sparkoperator.k8s.io"
            ],
            "resources": [
                "sparkapplications",
                "scheduledsparkapplications"
            ],
            "verbs": [
                "create",
                "delete",
                "deletecollection",
                "get",
                "list",
                "patch",
                "update",
                "watch"
            ]
        }
    ]
}