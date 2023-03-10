package spark

sparkApplication: {
    "apiVersion": "apiextensions.k8s.io/v1",
    "kind": "CustomResourceDefinition",
    "metadata": {
        "annotations": {
            "controller-gen.kubebuilder.io/version": "(unknown)",
            "api-approved.kubernetes.io": "https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/pull/1298"
        },
        "name": "sparkapplications.sparkoperator.k8s.io"
    },
    "spec": {
        "group": "sparkoperator.k8s.io",
        "names": {
            "kind": "SparkApplication",
            "listKind": "SparkApplicationList",
            "plural": "sparkapplications",
            "shortNames": [
                "sparkapp"
            ],
            "singular": "sparkapplication"
        },
        "scope": "Namespaced",
        "versions": [
            {
                "name": "v1beta2",
                "served": true,
                "storage": true,
                "subresources": {
                    "status": {}
                },
                "additionalPrinterColumns": [
                    {
                        "jsonPath": ".status.applicationState.state",
                        "name": "Status",
                        "type": "string"
                    },
                    {
                        "jsonPath": ".status.executionAttempts",
                        "name": "Attempts",
                        "type": "string"
                    },
                    {
                        "jsonPath": ".status.lastSubmissionAttemptTime",
                        "name": "Start",
                        "type": "string"
                    },
                    {
                        "jsonPath": ".status.terminationTime",
                        "name": "Finish",
                        "type": "string"
                    },
                    {
                        "jsonPath": ".metadata.creationTimestamp",
                        "name": "Age",
                        "type": "date"
                    }
                ],
                "schema": {
                    "openAPIV3Schema": {
                        "properties": {
                            "apiVersion": {
                                "type": "string"
                            },
                            "kind": {
                                "type": "string"
                            },
                            "metadata": {
                                "type": "object"
                            },
                            "spec": {
                                "properties": {
                                    "arguments": {
                                        "items": {
                                            "type": "string"
                                        },
                                        "type": "array"
                                    },
                                    "batchScheduler": {
                                        "type": "string"
                                    },
                                    "batchSchedulerOptions": {
                                        "properties": {
                                            "priorityClassName": {
                                                "type": "string"
                                            },
                                            "queue": {
                                                "type": "string"
                                            },
                                            "resources": {
                                                "additionalProperties": {
                                                    "anyOf": [
                                                        {
                                                            "type": "integer"
                                                        },
                                                        {
                                                            "type": "string"
                                                        }
                                                    ],
                                                    "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                    "x-kubernetes-int-or-string": true
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "deps": {
                                        "properties": {
                                            "excludePackages": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            },
                                            "files": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            },
                                            "jars": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            },
                                            "packages": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            },
                                            "pyFiles": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            },
                                            "repositories": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "driver": {
                                        "properties": {
                                            "affinity": {
                                                "properties": {
                                                    "nodeAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "preference": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchFields": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "preference",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "properties": {
                                                                    "nodeSelectorTerms": {
                                                                        "items": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchFields": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "type": "array"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "nodeSelectorTerms"
                                                                ],
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "podAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "podAffinityTerm": {
                                                                            "properties": {
                                                                                "labelSelector": {
                                                                                    "properties": {
                                                                                        "matchExpressions": {
                                                                                            "items": {
                                                                                                "properties": {
                                                                                                    "key": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "operator": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "values": {
                                                                                                        "items": {
                                                                                                            "type": "string"
                                                                                                        },
                                                                                                        "type": "array"
                                                                                                    }
                                                                                                },
                                                                                                "required": [
                                                                                                    "key",
                                                                                                    "operator"
                                                                                                ],
                                                                                                "type": "object"
                                                                                            },
                                                                                            "type": "array"
                                                                                        },
                                                                                        "matchLabels": {
                                                                                            "additionalProperties": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "type": "object"
                                                                                        }
                                                                                    },
                                                                                    "type": "object"
                                                                                },
                                                                                "namespaces": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "topologyKey": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "topologyKey"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "podAffinityTerm",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "labelSelector": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchLabels": {
                                                                                    "additionalProperties": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "object"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "namespaces": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "topologyKey": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "topologyKey"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "podAntiAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "podAffinityTerm": {
                                                                            "properties": {
                                                                                "labelSelector": {
                                                                                    "properties": {
                                                                                        "matchExpressions": {
                                                                                            "items": {
                                                                                                "properties": {
                                                                                                    "key": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "operator": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "values": {
                                                                                                        "items": {
                                                                                                            "type": "string"
                                                                                                        },
                                                                                                        "type": "array"
                                                                                                    }
                                                                                                },
                                                                                                "required": [
                                                                                                    "key",
                                                                                                    "operator"
                                                                                                ],
                                                                                                "type": "object"
                                                                                            },
                                                                                            "type": "array"
                                                                                        },
                                                                                        "matchLabels": {
                                                                                            "additionalProperties": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "type": "object"
                                                                                        }
                                                                                    },
                                                                                    "type": "object"
                                                                                },
                                                                                "namespaces": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "topologyKey": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "topologyKey"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "podAffinityTerm",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "labelSelector": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchLabels": {
                                                                                    "additionalProperties": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "object"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "namespaces": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "topologyKey": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "topologyKey"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "annotations": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "configMaps": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name",
                                                        "path"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "coreLimit": {
                                                "type": "string"
                                            },
                                            "coreRequest": {
                                                "type": "string"
                                            },
                                            "cores": {
                                                "format": "int32",
                                                "minimum": 1,
                                                "type": "integer"
                                            },
                                            "dnsConfig": {
                                                "properties": {
                                                    "nameservers": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "options": {
                                                        "items": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "value": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "searches": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "env": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "value": {
                                                            "type": "string"
                                                        },
                                                        "valueFrom": {
                                                            "properties": {
                                                                "configMapKeyRef": {
                                                                    "properties": {
                                                                        "key": {
                                                                            "type": "string"
                                                                        },
                                                                        "name": {
                                                                            "type": "string"
                                                                        },
                                                                        "optional": {
                                                                            "type": "boolean"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "key"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "fieldRef": {
                                                                    "properties": {
                                                                        "apiVersion": {
                                                                            "type": "string"
                                                                        },
                                                                        "fieldPath": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "fieldPath"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "resourceFieldRef": {
                                                                    "properties": {
                                                                        "containerName": {
                                                                            "type": "string"
                                                                        },
                                                                        "divisor": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "resource": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "resource"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "secretKeyRef": {
                                                                    "properties": {
                                                                        "key": {
                                                                            "type": "string"
                                                                        },
                                                                        "name": {
                                                                            "type": "string"
                                                                        },
                                                                        "optional": {
                                                                            "type": "boolean"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "key"
                                                                    ],
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "envFrom": {
                                                "items": {
                                                    "properties": {
                                                        "configMapRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "optional": {
                                                                    "type": "boolean"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "prefix": {
                                                            "type": "string"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "optional": {
                                                                    "type": "boolean"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "envSecretKeyRefs": {
                                                "additionalProperties": {
                                                    "properties": {
                                                        "key": {
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "key",
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "object"
                                            },
                                            "envVars": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "gpu": {
                                                "properties": {
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "quantity": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    }
                                                },
                                                "required": [
                                                    "name",
                                                    "quantity"
                                                ],
                                                "type": "object"
                                            },
                                            "hostAliases": {
                                                "items": {
                                                    "properties": {
                                                        "hostnames": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "ip": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "hostNetwork": {
                                                "type": "boolean"
                                            },
                                            "image": {
                                                "type": "string"
                                            },
                                            "initContainers": {
                                                "items": {
                                                    "properties": {
                                                        "args": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "command": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "env": {
                                                            "items": {
                                                                "properties": {
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "value": {
                                                                        "type": "string"
                                                                    },
                                                                    "valueFrom": {
                                                                        "properties": {
                                                                            "configMapKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "fieldRef": {
                                                                                "properties": {
                                                                                    "apiVersion": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "fieldPath": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "fieldPath"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "resourceFieldRef": {
                                                                                "properties": {
                                                                                    "containerName": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "divisor": {
                                                                                        "anyOf": [
                                                                                            {
                                                                                                "type": "integer"
                                                                                            },
                                                                                            {
                                                                                                "type": "string"
                                                                                            }
                                                                                        ],
                                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                        "x-kubernetes-int-or-string": true
                                                                                    },
                                                                                    "resource": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "resource"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "secretKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "envFrom": {
                                                            "items": {
                                                                "properties": {
                                                                    "configMapRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "prefix": {
                                                                        "type": "string"
                                                                    },
                                                                    "secretRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "image": {
                                                            "type": "string"
                                                        },
                                                        "imagePullPolicy": {
                                                            "type": "string"
                                                        },
                                                        "lifecycle": {
                                                            "properties": {
                                                                "postStart": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "preStop": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "livenessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "ports": {
                                                            "items": {
                                                                "properties": {
                                                                    "containerPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "hostIP": {
                                                                        "type": "string"
                                                                    },
                                                                    "hostPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "protocol": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "containerPort",
                                                                    "protocol"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array",
                                                            "x-kubernetes-list-map-keys": [
                                                                "containerPort",
                                                                "protocol"
                                                            ],
                                                            "x-kubernetes-list-type": "map"
                                                        },
                                                        "readinessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "resources": {
                                                            "properties": {
                                                                "limits": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "requests": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "securityContext": {
                                                            "properties": {
                                                                "allowPrivilegeEscalation": {
                                                                    "type": "boolean"
                                                                },
                                                                "capabilities": {
                                                                    "properties": {
                                                                        "add": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "drop": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "privileged": {
                                                                    "type": "boolean"
                                                                },
                                                                "procMount": {
                                                                    "type": "string"
                                                                },
                                                                "readOnlyRootFilesystem": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsGroup": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "runAsNonRoot": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsUser": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "seLinuxOptions": {
                                                                    "properties": {
                                                                        "level": {
                                                                            "type": "string"
                                                                        },
                                                                        "role": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": {
                                                                            "type": "string"
                                                                        },
                                                                        "user": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "windowsOptions": {
                                                                    "properties": {
                                                                        "gmsaCredentialSpec": {
                                                                            "type": "string"
                                                                        },
                                                                        "gmsaCredentialSpecName": {
                                                                            "type": "string"
                                                                        },
                                                                        "runAsUserName": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "startupProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "stdin": {
                                                            "type": "boolean"
                                                        },
                                                        "stdinOnce": {
                                                            "type": "boolean"
                                                        },
                                                        "terminationMessagePath": {
                                                            "type": "string"
                                                        },
                                                        "terminationMessagePolicy": {
                                                            "type": "string"
                                                        },
                                                        "tty": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeDevices": {
                                                            "items": {
                                                                "properties": {
                                                                    "devicePath": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "devicePath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "volumeMounts": {
                                                            "items": {
                                                                "properties": {
                                                                    "mountPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "mountPropagation": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "readOnly": {
                                                                        "type": "boolean"
                                                                    },
                                                                    "subPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "subPathExpr": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "mountPath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "workingDir": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "javaOptions": {
                                                "type": "string"
                                            },
                                            "kubernetesMaster": {
                                                "type": "string"
                                            },
                                            "labels": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "lifecycle": {
                                                "properties": {
                                                    "postStart": {
                                                        "properties": {
                                                            "exec": {
                                                                "properties": {
                                                                    "command": {
                                                                        "items": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": "array"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "httpGet": {
                                                                "properties": {
                                                                    "host": {
                                                                        "type": "string"
                                                                    },
                                                                    "httpHeaders": {
                                                                        "items": {
                                                                            "properties": {
                                                                                "name": {
                                                                                    "type": "string"
                                                                                },
                                                                                "value": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "name",
                                                                                "value"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "type": "array"
                                                                    },
                                                                    "path": {
                                                                        "type": "string"
                                                                    },
                                                                    "port": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "scheme": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "port"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "tcpSocket": {
                                                                "properties": {
                                                                    "host": {
                                                                        "type": "string"
                                                                    },
                                                                    "port": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "x-kubernetes-int-or-string": true
                                                                    }
                                                                },
                                                                "required": [
                                                                    "port"
                                                                ],
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "preStop": {
                                                        "properties": {
                                                            "exec": {
                                                                "properties": {
                                                                    "command": {
                                                                        "items": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": "array"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "httpGet": {
                                                                "properties": {
                                                                    "host": {
                                                                        "type": "string"
                                                                    },
                                                                    "httpHeaders": {
                                                                        "items": {
                                                                            "properties": {
                                                                                "name": {
                                                                                    "type": "string"
                                                                                },
                                                                                "value": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "name",
                                                                                "value"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "type": "array"
                                                                    },
                                                                    "path": {
                                                                        "type": "string"
                                                                    },
                                                                    "port": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "scheme": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "port"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "tcpSocket": {
                                                                "properties": {
                                                                    "host": {
                                                                        "type": "string"
                                                                    },
                                                                    "port": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "x-kubernetes-int-or-string": true
                                                                    }
                                                                },
                                                                "required": [
                                                                    "port"
                                                                ],
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "memory": {
                                                "type": "string"
                                            },
                                            "memoryOverhead": {
                                                "type": "string"
                                            },
                                            "nodeSelector": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "podName": {
                                                "pattern": "[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*",
                                                "type": "string"
                                            },
                                            "podSecurityContext": {
                                                "properties": {
                                                    "fsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsNonRoot": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsUser": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "seLinuxOptions": {
                                                        "properties": {
                                                            "level": {
                                                                "type": "string"
                                                            },
                                                            "role": {
                                                                "type": "string"
                                                            },
                                                            "type": {
                                                                "type": "string"
                                                            },
                                                            "user": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "supplementalGroups": {
                                                        "items": {
                                                            "format": "int64",
                                                            "type": "integer"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "sysctls": {
                                                        "items": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "value": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "required": [
                                                                "name",
                                                                "value"
                                                            ],
                                                            "type": "object"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "windowsOptions": {
                                                        "properties": {
                                                            "gmsaCredentialSpec": {
                                                                "type": "string"
                                                            },
                                                            "gmsaCredentialSpecName": {
                                                                "type": "string"
                                                            },
                                                            "runAsUserName": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "schedulerName": {
                                                "type": "string"
                                            },
                                            "secrets": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "secretType": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name",
                                                        "path",
                                                        "secretType"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "securityContext": {
                                                "properties": {
                                                    "allowPrivilegeEscalation": {
                                                        "type": "boolean"
                                                    },
                                                    "capabilities": {
                                                        "properties": {
                                                            "add": {
                                                                "items": {
                                                                    "type": "string"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "drop": {
                                                                "items": {
                                                                    "type": "string"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "privileged": {
                                                        "type": "boolean"
                                                    },
                                                    "procMount": {
                                                        "type": "string"
                                                    },
                                                    "readOnlyRootFilesystem": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsNonRoot": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsUser": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "seLinuxOptions": {
                                                        "properties": {
                                                            "level": {
                                                                "type": "string"
                                                            },
                                                            "role": {
                                                                "type": "string"
                                                            },
                                                            "type": {
                                                                "type": "string"
                                                            },
                                                            "user": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "windowsOptions": {
                                                        "properties": {
                                                            "gmsaCredentialSpec": {
                                                                "type": "string"
                                                            },
                                                            "gmsaCredentialSpecName": {
                                                                "type": "string"
                                                            },
                                                            "runAsUserName": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "serviceAccount": {
                                                "type": "string"
                                            },
                                            "serviceAnnotations": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "shareProcessNamespace": {
                                                "type": "boolean"
                                            },
                                            "sidecars": {
                                                "items": {
                                                    "properties": {
                                                        "args": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "command": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "env": {
                                                            "items": {
                                                                "properties": {
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "value": {
                                                                        "type": "string"
                                                                    },
                                                                    "valueFrom": {
                                                                        "properties": {
                                                                            "configMapKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "fieldRef": {
                                                                                "properties": {
                                                                                    "apiVersion": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "fieldPath": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "fieldPath"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "resourceFieldRef": {
                                                                                "properties": {
                                                                                    "containerName": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "divisor": {
                                                                                        "anyOf": [
                                                                                            {
                                                                                                "type": "integer"
                                                                                            },
                                                                                            {
                                                                                                "type": "string"
                                                                                            }
                                                                                        ],
                                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                        "x-kubernetes-int-or-string": true
                                                                                    },
                                                                                    "resource": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "resource"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "secretKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "envFrom": {
                                                            "items": {
                                                                "properties": {
                                                                    "configMapRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "prefix": {
                                                                        "type": "string"
                                                                    },
                                                                    "secretRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "image": {
                                                            "type": "string"
                                                        },
                                                        "imagePullPolicy": {
                                                            "type": "string"
                                                        },
                                                        "lifecycle": {
                                                            "properties": {
                                                                "postStart": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "preStop": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "livenessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "ports": {
                                                            "items": {
                                                                "properties": {
                                                                    "containerPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "hostIP": {
                                                                        "type": "string"
                                                                    },
                                                                    "hostPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "protocol": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "containerPort",
                                                                    "protocol"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array",
                                                            "x-kubernetes-list-map-keys": [
                                                                "containerPort",
                                                                "protocol"
                                                            ],
                                                            "x-kubernetes-list-type": "map"
                                                        },
                                                        "readinessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "resources": {
                                                            "properties": {
                                                                "limits": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "requests": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "securityContext": {
                                                            "properties": {
                                                                "allowPrivilegeEscalation": {
                                                                    "type": "boolean"
                                                                },
                                                                "capabilities": {
                                                                    "properties": {
                                                                        "add": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "drop": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "privileged": {
                                                                    "type": "boolean"
                                                                },
                                                                "procMount": {
                                                                    "type": "string"
                                                                },
                                                                "readOnlyRootFilesystem": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsGroup": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "runAsNonRoot": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsUser": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "seLinuxOptions": {
                                                                    "properties": {
                                                                        "level": {
                                                                            "type": "string"
                                                                        },
                                                                        "role": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": {
                                                                            "type": "string"
                                                                        },
                                                                        "user": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "windowsOptions": {
                                                                    "properties": {
                                                                        "gmsaCredentialSpec": {
                                                                            "type": "string"
                                                                        },
                                                                        "gmsaCredentialSpecName": {
                                                                            "type": "string"
                                                                        },
                                                                        "runAsUserName": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "startupProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "stdin": {
                                                            "type": "boolean"
                                                        },
                                                        "stdinOnce": {
                                                            "type": "boolean"
                                                        },
                                                        "terminationMessagePath": {
                                                            "type": "string"
                                                        },
                                                        "terminationMessagePolicy": {
                                                            "type": "string"
                                                        },
                                                        "tty": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeDevices": {
                                                            "items": {
                                                                "properties": {
                                                                    "devicePath": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "devicePath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "volumeMounts": {
                                                            "items": {
                                                                "properties": {
                                                                    "mountPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "mountPropagation": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "readOnly": {
                                                                        "type": "boolean"
                                                                    },
                                                                    "subPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "subPathExpr": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "mountPath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "workingDir": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "terminationGracePeriodSeconds": {
                                                "format": "int64",
                                                "type": "integer"
                                            },
                                            "tolerations": {
                                                "items": {
                                                    "properties": {
                                                        "effect": {
                                                            "type": "string"
                                                        },
                                                        "key": {
                                                            "type": "string"
                                                        },
                                                        "operator": {
                                                            "type": "string"
                                                        },
                                                        "tolerationSeconds": {
                                                            "format": "int64",
                                                            "type": "integer"
                                                        },
                                                        "value": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "volumeMounts": {
                                                "items": {
                                                    "properties": {
                                                        "mountPath": {
                                                            "type": "string"
                                                        },
                                                        "mountPropagation": {
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "subPath": {
                                                            "type": "string"
                                                        },
                                                        "subPathExpr": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "mountPath",
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "dynamicAllocation": {
                                        "properties": {
                                            "enabled": {
                                                "type": "boolean"
                                            },
                                            "initialExecutors": {
                                                "format": "int32",
                                                "type": "integer"
                                            },
                                            "maxExecutors": {
                                                "format": "int32",
                                                "type": "integer"
                                            },
                                            "minExecutors": {
                                                "format": "int32",
                                                "type": "integer"
                                            },
                                            "shuffleTrackingTimeout": {
                                                "format": "int64",
                                                "type": "integer"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "executor": {
                                        "properties": {
                                            "affinity": {
                                                "properties": {
                                                    "nodeAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "preference": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchFields": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "preference",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "properties": {
                                                                    "nodeSelectorTerms": {
                                                                        "items": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchFields": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "type": "array"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "nodeSelectorTerms"
                                                                ],
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "podAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "podAffinityTerm": {
                                                                            "properties": {
                                                                                "labelSelector": {
                                                                                    "properties": {
                                                                                        "matchExpressions": {
                                                                                            "items": {
                                                                                                "properties": {
                                                                                                    "key": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "operator": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "values": {
                                                                                                        "items": {
                                                                                                            "type": "string"
                                                                                                        },
                                                                                                        "type": "array"
                                                                                                    }
                                                                                                },
                                                                                                "required": [
                                                                                                    "key",
                                                                                                    "operator"
                                                                                                ],
                                                                                                "type": "object"
                                                                                            },
                                                                                            "type": "array"
                                                                                        },
                                                                                        "matchLabels": {
                                                                                            "additionalProperties": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "type": "object"
                                                                                        }
                                                                                    },
                                                                                    "type": "object"
                                                                                },
                                                                                "namespaces": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "topologyKey": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "topologyKey"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "podAffinityTerm",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "labelSelector": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchLabels": {
                                                                                    "additionalProperties": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "object"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "namespaces": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "topologyKey": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "topologyKey"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "podAntiAffinity": {
                                                        "properties": {
                                                            "preferredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "podAffinityTerm": {
                                                                            "properties": {
                                                                                "labelSelector": {
                                                                                    "properties": {
                                                                                        "matchExpressions": {
                                                                                            "items": {
                                                                                                "properties": {
                                                                                                    "key": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "operator": {
                                                                                                        "type": "string"
                                                                                                    },
                                                                                                    "values": {
                                                                                                        "items": {
                                                                                                            "type": "string"
                                                                                                        },
                                                                                                        "type": "array"
                                                                                                    }
                                                                                                },
                                                                                                "required": [
                                                                                                    "key",
                                                                                                    "operator"
                                                                                                ],
                                                                                                "type": "object"
                                                                                            },
                                                                                            "type": "array"
                                                                                        },
                                                                                        "matchLabels": {
                                                                                            "additionalProperties": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "type": "object"
                                                                                        }
                                                                                    },
                                                                                    "type": "object"
                                                                                },
                                                                                "namespaces": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "topologyKey": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "topologyKey"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "weight": {
                                                                            "format": "int32",
                                                                            "type": "integer"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "podAffinityTerm",
                                                                        "weight"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                                                "items": {
                                                                    "properties": {
                                                                        "labelSelector": {
                                                                            "properties": {
                                                                                "matchExpressions": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "key": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "operator": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "values": {
                                                                                                "items": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "type": "array"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "key",
                                                                                            "operator"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "matchLabels": {
                                                                                    "additionalProperties": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "object"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "namespaces": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "topologyKey": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "topologyKey"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "annotations": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "configMaps": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name",
                                                        "path"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "coreLimit": {
                                                "type": "string"
                                            },
                                            "coreRequest": {
                                                "type": "string"
                                            },
                                            "cores": {
                                                "format": "int32",
                                                "minimum": 1,
                                                "type": "integer"
                                            },
                                            "deleteOnTermination": {
                                                "type": "boolean"
                                            },
                                            "dnsConfig": {
                                                "properties": {
                                                    "nameservers": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "options": {
                                                        "items": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "value": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "searches": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "env": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "value": {
                                                            "type": "string"
                                                        },
                                                        "valueFrom": {
                                                            "properties": {
                                                                "configMapKeyRef": {
                                                                    "properties": {
                                                                        "key": {
                                                                            "type": "string"
                                                                        },
                                                                        "name": {
                                                                            "type": "string"
                                                                        },
                                                                        "optional": {
                                                                            "type": "boolean"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "key"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "fieldRef": {
                                                                    "properties": {
                                                                        "apiVersion": {
                                                                            "type": "string"
                                                                        },
                                                                        "fieldPath": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "fieldPath"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "resourceFieldRef": {
                                                                    "properties": {
                                                                        "containerName": {
                                                                            "type": "string"
                                                                        },
                                                                        "divisor": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "resource": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "resource"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "secretKeyRef": {
                                                                    "properties": {
                                                                        "key": {
                                                                            "type": "string"
                                                                        },
                                                                        "name": {
                                                                            "type": "string"
                                                                        },
                                                                        "optional": {
                                                                            "type": "boolean"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "key"
                                                                    ],
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "envFrom": {
                                                "items": {
                                                    "properties": {
                                                        "configMapRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "optional": {
                                                                    "type": "boolean"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "prefix": {
                                                            "type": "string"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "optional": {
                                                                    "type": "boolean"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "envSecretKeyRefs": {
                                                "additionalProperties": {
                                                    "properties": {
                                                        "key": {
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "key",
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "object"
                                            },
                                            "envVars": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "gpu": {
                                                "properties": {
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "quantity": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    }
                                                },
                                                "required": [
                                                    "name",
                                                    "quantity"
                                                ],
                                                "type": "object"
                                            },
                                            "hostAliases": {
                                                "items": {
                                                    "properties": {
                                                        "hostnames": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "ip": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "hostNetwork": {
                                                "type": "boolean"
                                            },
                                            "image": {
                                                "type": "string"
                                            },
                                            "initContainers": {
                                                "items": {
                                                    "properties": {
                                                        "args": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "command": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "env": {
                                                            "items": {
                                                                "properties": {
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "value": {
                                                                        "type": "string"
                                                                    },
                                                                    "valueFrom": {
                                                                        "properties": {
                                                                            "configMapKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "fieldRef": {
                                                                                "properties": {
                                                                                    "apiVersion": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "fieldPath": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "fieldPath"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "resourceFieldRef": {
                                                                                "properties": {
                                                                                    "containerName": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "divisor": {
                                                                                        "anyOf": [
                                                                                            {
                                                                                                "type": "integer"
                                                                                            },
                                                                                            {
                                                                                                "type": "string"
                                                                                            }
                                                                                        ],
                                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                        "x-kubernetes-int-or-string": true
                                                                                    },
                                                                                    "resource": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "resource"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "secretKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "envFrom": {
                                                            "items": {
                                                                "properties": {
                                                                    "configMapRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "prefix": {
                                                                        "type": "string"
                                                                    },
                                                                    "secretRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "image": {
                                                            "type": "string"
                                                        },
                                                        "imagePullPolicy": {
                                                            "type": "string"
                                                        },
                                                        "lifecycle": {
                                                            "properties": {
                                                                "postStart": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "preStop": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "livenessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "ports": {
                                                            "items": {
                                                                "properties": {
                                                                    "containerPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "hostIP": {
                                                                        "type": "string"
                                                                    },
                                                                    "hostPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "protocol": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "containerPort",
                                                                    "protocol"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array",
                                                            "x-kubernetes-list-map-keys": [
                                                                "containerPort",
                                                                "protocol"
                                                            ],
                                                            "x-kubernetes-list-type": "map"
                                                        },
                                                        "readinessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "resources": {
                                                            "properties": {
                                                                "limits": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "requests": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "securityContext": {
                                                            "properties": {
                                                                "allowPrivilegeEscalation": {
                                                                    "type": "boolean"
                                                                },
                                                                "capabilities": {
                                                                    "properties": {
                                                                        "add": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "drop": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "privileged": {
                                                                    "type": "boolean"
                                                                },
                                                                "procMount": {
                                                                    "type": "string"
                                                                },
                                                                "readOnlyRootFilesystem": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsGroup": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "runAsNonRoot": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsUser": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "seLinuxOptions": {
                                                                    "properties": {
                                                                        "level": {
                                                                            "type": "string"
                                                                        },
                                                                        "role": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": {
                                                                            "type": "string"
                                                                        },
                                                                        "user": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "windowsOptions": {
                                                                    "properties": {
                                                                        "gmsaCredentialSpec": {
                                                                            "type": "string"
                                                                        },
                                                                        "gmsaCredentialSpecName": {
                                                                            "type": "string"
                                                                        },
                                                                        "runAsUserName": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "startupProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "stdin": {
                                                            "type": "boolean"
                                                        },
                                                        "stdinOnce": {
                                                            "type": "boolean"
                                                        },
                                                        "terminationMessagePath": {
                                                            "type": "string"
                                                        },
                                                        "terminationMessagePolicy": {
                                                            "type": "string"
                                                        },
                                                        "tty": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeDevices": {
                                                            "items": {
                                                                "properties": {
                                                                    "devicePath": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "devicePath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "volumeMounts": {
                                                            "items": {
                                                                "properties": {
                                                                    "mountPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "mountPropagation": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "readOnly": {
                                                                        "type": "boolean"
                                                                    },
                                                                    "subPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "subPathExpr": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "mountPath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "workingDir": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "instances": {
                                                "format": "int32",
                                                "minimum": 1,
                                                "type": "integer"
                                            },
                                            "javaOptions": {
                                                "type": "string"
                                            },
                                            "labels": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "memory": {
                                                "type": "string"
                                            },
                                            "memoryOverhead": {
                                                "type": "string"
                                            },
                                            "nodeSelector": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "podSecurityContext": {
                                                "properties": {
                                                    "fsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsNonRoot": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsUser": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "seLinuxOptions": {
                                                        "properties": {
                                                            "level": {
                                                                "type": "string"
                                                            },
                                                            "role": {
                                                                "type": "string"
                                                            },
                                                            "type": {
                                                                "type": "string"
                                                            },
                                                            "user": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "supplementalGroups": {
                                                        "items": {
                                                            "format": "int64",
                                                            "type": "integer"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "sysctls": {
                                                        "items": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                },
                                                                "value": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "required": [
                                                                "name",
                                                                "value"
                                                            ],
                                                            "type": "object"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "windowsOptions": {
                                                        "properties": {
                                                            "gmsaCredentialSpec": {
                                                                "type": "string"
                                                            },
                                                            "gmsaCredentialSpecName": {
                                                                "type": "string"
                                                            },
                                                            "runAsUserName": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "schedulerName": {
                                                "type": "string"
                                            },
                                            "secrets": {
                                                "items": {
                                                    "properties": {
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "secretType": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name",
                                                        "path",
                                                        "secretType"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "securityContext": {
                                                "properties": {
                                                    "allowPrivilegeEscalation": {
                                                        "type": "boolean"
                                                    },
                                                    "capabilities": {
                                                        "properties": {
                                                            "add": {
                                                                "items": {
                                                                    "type": "string"
                                                                },
                                                                "type": "array"
                                                            },
                                                            "drop": {
                                                                "items": {
                                                                    "type": "string"
                                                                },
                                                                "type": "array"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "privileged": {
                                                        "type": "boolean"
                                                    },
                                                    "procMount": {
                                                        "type": "string"
                                                    },
                                                    "readOnlyRootFilesystem": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsGroup": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "runAsNonRoot": {
                                                        "type": "boolean"
                                                    },
                                                    "runAsUser": {
                                                        "format": "int64",
                                                        "type": "integer"
                                                    },
                                                    "seLinuxOptions": {
                                                        "properties": {
                                                            "level": {
                                                                "type": "string"
                                                            },
                                                            "role": {
                                                                "type": "string"
                                                            },
                                                            "type": {
                                                                "type": "string"
                                                            },
                                                            "user": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "windowsOptions": {
                                                        "properties": {
                                                            "gmsaCredentialSpec": {
                                                                "type": "string"
                                                            },
                                                            "gmsaCredentialSpecName": {
                                                                "type": "string"
                                                            },
                                                            "runAsUserName": {
                                                                "type": "string"
                                                            }
                                                        },
                                                        "type": "object"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "serviceAccount": {
                                                "type": "string"
                                            },
                                            "shareProcessNamespace": {
                                                "type": "boolean"
                                            },
                                            "sidecars": {
                                                "items": {
                                                    "properties": {
                                                        "args": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "command": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "env": {
                                                            "items": {
                                                                "properties": {
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "value": {
                                                                        "type": "string"
                                                                    },
                                                                    "valueFrom": {
                                                                        "properties": {
                                                                            "configMapKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "fieldRef": {
                                                                                "properties": {
                                                                                    "apiVersion": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "fieldPath": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "fieldPath"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "resourceFieldRef": {
                                                                                "properties": {
                                                                                    "containerName": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "divisor": {
                                                                                        "anyOf": [
                                                                                            {
                                                                                                "type": "integer"
                                                                                            },
                                                                                            {
                                                                                                "type": "string"
                                                                                            }
                                                                                        ],
                                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                        "x-kubernetes-int-or-string": true
                                                                                    },
                                                                                    "resource": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "resource"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "secretKeyRef": {
                                                                                "properties": {
                                                                                    "key": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "optional": {
                                                                                        "type": "boolean"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "key"
                                                                                ],
                                                                                "type": "object"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "envFrom": {
                                                            "items": {
                                                                "properties": {
                                                                    "configMapRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "prefix": {
                                                                        "type": "string"
                                                                    },
                                                                    "secretRef": {
                                                                        "properties": {
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "image": {
                                                            "type": "string"
                                                        },
                                                        "imagePullPolicy": {
                                                            "type": "string"
                                                        },
                                                        "lifecycle": {
                                                            "properties": {
                                                                "postStart": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "preStop": {
                                                                    "properties": {
                                                                        "exec": {
                                                                            "properties": {
                                                                                "command": {
                                                                                    "items": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "type": "array"
                                                                                }
                                                                            },
                                                                            "type": "object"
                                                                        },
                                                                        "httpGet": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "httpHeaders": {
                                                                                    "items": {
                                                                                        "properties": {
                                                                                            "name": {
                                                                                                "type": "string"
                                                                                            },
                                                                                            "value": {
                                                                                                "type": "string"
                                                                                            }
                                                                                        },
                                                                                        "required": [
                                                                                            "name",
                                                                                            "value"
                                                                                        ],
                                                                                        "type": "object"
                                                                                    },
                                                                                    "type": "array"
                                                                                },
                                                                                "path": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                },
                                                                                "scheme": {
                                                                                    "type": "string"
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        },
                                                                        "tcpSocket": {
                                                                            "properties": {
                                                                                "host": {
                                                                                    "type": "string"
                                                                                },
                                                                                "port": {
                                                                                    "anyOf": [
                                                                                        {
                                                                                            "type": "integer"
                                                                                        },
                                                                                        {
                                                                                            "type": "string"
                                                                                        }
                                                                                    ],
                                                                                    "x-kubernetes-int-or-string": true
                                                                                }
                                                                            },
                                                                            "required": [
                                                                                "port"
                                                                            ],
                                                                            "type": "object"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "livenessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "ports": {
                                                            "items": {
                                                                "properties": {
                                                                    "containerPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "hostIP": {
                                                                        "type": "string"
                                                                    },
                                                                    "hostPort": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "protocol": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "containerPort",
                                                                    "protocol"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array",
                                                            "x-kubernetes-list-map-keys": [
                                                                "containerPort",
                                                                "protocol"
                                                            ],
                                                            "x-kubernetes-list-type": "map"
                                                        },
                                                        "readinessProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "resources": {
                                                            "properties": {
                                                                "limits": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "requests": {
                                                                    "additionalProperties": {
                                                                        "anyOf": [
                                                                            {
                                                                                "type": "integer"
                                                                            },
                                                                            {
                                                                                "type": "string"
                                                                            }
                                                                        ],
                                                                        "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                        "x-kubernetes-int-or-string": true
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "securityContext": {
                                                            "properties": {
                                                                "allowPrivilegeEscalation": {
                                                                    "type": "boolean"
                                                                },
                                                                "capabilities": {
                                                                    "properties": {
                                                                        "add": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "drop": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "privileged": {
                                                                    "type": "boolean"
                                                                },
                                                                "procMount": {
                                                                    "type": "string"
                                                                },
                                                                "readOnlyRootFilesystem": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsGroup": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "runAsNonRoot": {
                                                                    "type": "boolean"
                                                                },
                                                                "runAsUser": {
                                                                    "format": "int64",
                                                                    "type": "integer"
                                                                },
                                                                "seLinuxOptions": {
                                                                    "properties": {
                                                                        "level": {
                                                                            "type": "string"
                                                                        },
                                                                        "role": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": {
                                                                            "type": "string"
                                                                        },
                                                                        "user": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "windowsOptions": {
                                                                    "properties": {
                                                                        "gmsaCredentialSpec": {
                                                                            "type": "string"
                                                                        },
                                                                        "gmsaCredentialSpecName": {
                                                                            "type": "string"
                                                                        },
                                                                        "runAsUserName": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "startupProbe": {
                                                            "properties": {
                                                                "exec": {
                                                                    "properties": {
                                                                        "command": {
                                                                            "items": {
                                                                                "type": "string"
                                                                            },
                                                                            "type": "array"
                                                                        }
                                                                    },
                                                                    "type": "object"
                                                                },
                                                                "failureThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "httpGet": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "httpHeaders": {
                                                                            "items": {
                                                                                "properties": {
                                                                                    "name": {
                                                                                        "type": "string"
                                                                                    },
                                                                                    "value": {
                                                                                        "type": "string"
                                                                                    }
                                                                                },
                                                                                "required": [
                                                                                    "name",
                                                                                    "value"
                                                                                ],
                                                                                "type": "object"
                                                                            },
                                                                            "type": "array"
                                                                        },
                                                                        "path": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        },
                                                                        "scheme": {
                                                                            "type": "string"
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "initialDelaySeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "periodSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "successThreshold": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                },
                                                                "tcpSocket": {
                                                                    "properties": {
                                                                        "host": {
                                                                            "type": "string"
                                                                        },
                                                                        "port": {
                                                                            "anyOf": [
                                                                                {
                                                                                    "type": "integer"
                                                                                },
                                                                                {
                                                                                    "type": "string"
                                                                                }
                                                                            ],
                                                                            "x-kubernetes-int-or-string": true
                                                                        }
                                                                    },
                                                                    "required": [
                                                                        "port"
                                                                    ],
                                                                    "type": "object"
                                                                },
                                                                "timeoutSeconds": {
                                                                    "format": "int32",
                                                                    "type": "integer"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "stdin": {
                                                            "type": "boolean"
                                                        },
                                                        "stdinOnce": {
                                                            "type": "boolean"
                                                        },
                                                        "terminationMessagePath": {
                                                            "type": "string"
                                                        },
                                                        "terminationMessagePolicy": {
                                                            "type": "string"
                                                        },
                                                        "tty": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeDevices": {
                                                            "items": {
                                                                "properties": {
                                                                    "devicePath": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "devicePath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "volumeMounts": {
                                                            "items": {
                                                                "properties": {
                                                                    "mountPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "mountPropagation": {
                                                                        "type": "string"
                                                                    },
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "readOnly": {
                                                                        "type": "boolean"
                                                                    },
                                                                    "subPath": {
                                                                        "type": "string"
                                                                    },
                                                                    "subPathExpr": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "mountPath",
                                                                    "name"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "workingDir": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "terminationGracePeriodSeconds": {
                                                "format": "int64",
                                                "type": "integer"
                                            },
                                            "tolerations": {
                                                "items": {
                                                    "properties": {
                                                        "effect": {
                                                            "type": "string"
                                                        },
                                                        "key": {
                                                            "type": "string"
                                                        },
                                                        "operator": {
                                                            "type": "string"
                                                        },
                                                        "tolerationSeconds": {
                                                            "format": "int64",
                                                            "type": "integer"
                                                        },
                                                        "value": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "volumeMounts": {
                                                "items": {
                                                    "properties": {
                                                        "mountPath": {
                                                            "type": "string"
                                                        },
                                                        "mountPropagation": {
                                                            "type": "string"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "subPath": {
                                                            "type": "string"
                                                        },
                                                        "subPathExpr": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "mountPath",
                                                        "name"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "failureRetries": {
                                        "format": "int32",
                                        "type": "integer"
                                    },
                                    "hadoopConf": {
                                        "additionalProperties": {
                                            "type": "string"
                                        },
                                        "type": "object"
                                    },
                                    "hadoopConfigMap": {
                                        "type": "string"
                                    },
                                    "image": {
                                        "type": "string"
                                    },
                                    "imagePullPolicy": {
                                        "type": "string"
                                    },
                                    "imagePullSecrets": {
                                        "items": {
                                            "type": "string"
                                        },
                                        "type": "array"
                                    },
                                    "mainApplicationFile": {
                                        "type": "string"
                                    },
                                    "mainClass": {
                                        "type": "string"
                                    },
                                    "memoryOverheadFactor": {
                                        "type": "string"
                                    },
                                    "mode": {
                                        "enum": [
                                            "cluster",
                                            "client"
                                        ],
                                        "type": "string"
                                    },
                                    "monitoring": {
                                        "properties": {
                                            "exposeDriverMetrics": {
                                                "type": "boolean"
                                            },
                                            "exposeExecutorMetrics": {
                                                "type": "boolean"
                                            },
                                            "metricsProperties": {
                                                "type": "string"
                                            },
                                            "metricsPropertiesFile": {
                                                "type": "string"
                                            },
                                            "prometheus": {
                                                "properties": {
                                                    "configFile": {
                                                        "type": "string"
                                                    },
                                                    "configuration": {
                                                        "type": "string"
                                                    },
                                                    "jmxExporterJar": {
                                                        "type": "string"
                                                    },
                                                    "port": {
                                                        "format": "int32",
                                                        "maximum": 49151,
                                                        "minimum": 1024,
                                                        "type": "integer"
                                                    },
                                                    "portName": {
                                                        "type": "string"
                                                    }
                                                },
                                                "required": [
                                                    "jmxExporterJar"
                                                ],
                                                "type": "object"
                                            }
                                        },
                                        "required": [
                                            "exposeDriverMetrics",
                                            "exposeExecutorMetrics"
                                        ],
                                        "type": "object"
                                    },
                                    "nodeSelector": {
                                        "additionalProperties": {
                                            "type": "string"
                                        },
                                        "type": "object"
                                    },
                                    "proxyUser": {
                                        "type": "string"
                                    },
                                    "pythonVersion": {
                                        "enum": [
                                            "2",
                                            "3"
                                        ],
                                        "type": "string"
                                    },
                                    "restartPolicy": {
                                        "properties": {
                                            "onFailureRetries": {
                                                "format": "int32",
                                                "minimum": 0,
                                                "type": "integer"
                                            },
                                            "onFailureRetryInterval": {
                                                "format": "int64",
                                                "minimum": 1,
                                                "type": "integer"
                                            },
                                            "onSubmissionFailureRetries": {
                                                "format": "int32",
                                                "minimum": 0,
                                                "type": "integer"
                                            },
                                            "onSubmissionFailureRetryInterval": {
                                                "format": "int64",
                                                "minimum": 1,
                                                "type": "integer"
                                            },
                                            "type": {
                                                "enum": [
                                                    "Never",
                                                    "Always",
                                                    "OnFailure"
                                                ],
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "retryInterval": {
                                        "format": "int64",
                                        "type": "integer"
                                    },
                                    "sparkConf": {
                                        "additionalProperties": {
                                            "type": "string"
                                        },
                                        "type": "object"
                                    },
                                    "sparkConfigMap": {
                                        "type": "string"
                                    },
                                    "sparkUIOptions": {
                                        "properties": {
                                            "serviceAnnotations": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "ingressAnnotations": {
                                                "additionalProperties": {
                                                    "type": "string"
                                                },
                                                "type": "object"
                                            },
                                            "ingressTLS": {
                                                "items": {
                                                    "properties": {
                                                        "hosts": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "secretName": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            },
                                            "servicePort": {
                                                "format": "int32",
                                                "type": "integer"
                                            },
                                            "servicePortName": {
                                                "type": "string"
                                            },
                                            "serviceType": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "sparkVersion": {
                                        "type": "string"
                                    },
                                    "timeToLiveSeconds": {
                                        "format": "int64",
                                        "type": "integer"
                                    },
                                    "type": {
                                        "enum": [
                                            "Java",
                                            "Python",
                                            "Scala",
                                            "R"
                                        ],
                                        "type": "string"
                                    },
                                    "volumes": {
                                        "items": {
                                            "properties": {
                                                "awsElasticBlockStore": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "partition": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeID": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "volumeID"
                                                    ],
                                                    "type": "object"
                                                },
                                                "azureDisk": {
                                                    "properties": {
                                                        "cachingMode": {
                                                            "type": "string"
                                                        },
                                                        "diskName": {
                                                            "type": "string"
                                                        },
                                                        "diskURI": {
                                                            "type": "string"
                                                        },
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "kind": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "required": [
                                                        "diskName",
                                                        "diskURI"
                                                    ],
                                                    "type": "object"
                                                },
                                                "azureFile": {
                                                    "properties": {
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretName": {
                                                            "type": "string"
                                                        },
                                                        "shareName": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "secretName",
                                                        "shareName"
                                                    ],
                                                    "type": "object"
                                                },
                                                "cephfs": {
                                                    "properties": {
                                                        "monitors": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretFile": {
                                                            "type": "string"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "user": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "monitors"
                                                    ],
                                                    "type": "object"
                                                },
                                                "cinder": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "volumeID": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "volumeID"
                                                    ],
                                                    "type": "object"
                                                },
                                                "configMap": {
                                                    "properties": {
                                                        "defaultMode": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "items": {
                                                            "items": {
                                                                "properties": {
                                                                    "key": {
                                                                        "type": "string"
                                                                    },
                                                                    "mode": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "path": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "key",
                                                                    "path"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "optional": {
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "csi": {
                                                    "properties": {
                                                        "driver": {
                                                            "type": "string"
                                                        },
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "nodePublishSecretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeAttributes": {
                                                            "additionalProperties": {
                                                                "type": "string"
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "required": [
                                                        "driver"
                                                    ],
                                                    "type": "object"
                                                },
                                                "downwardAPI": {
                                                    "properties": {
                                                        "defaultMode": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "items": {
                                                            "items": {
                                                                "properties": {
                                                                    "fieldRef": {
                                                                        "properties": {
                                                                            "apiVersion": {
                                                                                "type": "string"
                                                                            },
                                                                            "fieldPath": {
                                                                                "type": "string"
                                                                            }
                                                                        },
                                                                        "required": [
                                                                            "fieldPath"
                                                                        ],
                                                                        "type": "object"
                                                                    },
                                                                    "mode": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "path": {
                                                                        "type": "string"
                                                                    },
                                                                    "resourceFieldRef": {
                                                                        "properties": {
                                                                            "containerName": {
                                                                                "type": "string"
                                                                            },
                                                                            "divisor": {
                                                                                "anyOf": [
                                                                                    {
                                                                                        "type": "integer"
                                                                                    },
                                                                                    {
                                                                                        "type": "string"
                                                                                    }
                                                                                ],
                                                                                "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                "x-kubernetes-int-or-string": true
                                                                            },
                                                                            "resource": {
                                                                                "type": "string"
                                                                            }
                                                                        },
                                                                        "required": [
                                                                            "resource"
                                                                        ],
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "path"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "emptyDir": {
                                                    "properties": {
                                                        "medium": {
                                                            "type": "string"
                                                        },
                                                        "sizeLimit": {
                                                            "anyOf": [
                                                                {
                                                                    "type": "integer"
                                                                },
                                                                {
                                                                    "type": "string"
                                                                }
                                                            ],
                                                            "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                            "x-kubernetes-int-or-string": true
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "fc": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "lun": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "targetWWNs": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "wwids": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "flexVolume": {
                                                    "properties": {
                                                        "driver": {
                                                            "type": "string"
                                                        },
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "options": {
                                                            "additionalProperties": {
                                                                "type": "string"
                                                            },
                                                            "type": "object"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        }
                                                    },
                                                    "required": [
                                                        "driver"
                                                    ],
                                                    "type": "object"
                                                },
                                                "flocker": {
                                                    "properties": {
                                                        "datasetName": {
                                                            "type": "string"
                                                        },
                                                        "datasetUUID": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "gcePersistentDisk": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "partition": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "pdName": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "required": [
                                                        "pdName"
                                                    ],
                                                    "type": "object"
                                                },
                                                "gitRepo": {
                                                    "properties": {
                                                        "directory": {
                                                            "type": "string"
                                                        },
                                                        "repository": {
                                                            "type": "string"
                                                        },
                                                        "revision": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "repository"
                                                    ],
                                                    "type": "object"
                                                },
                                                "glusterfs": {
                                                    "properties": {
                                                        "endpoints": {
                                                            "type": "string"
                                                        },
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "required": [
                                                        "endpoints",
                                                        "path"
                                                    ],
                                                    "type": "object"
                                                },
                                                "hostPath": {
                                                    "properties": {
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "type": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "path"
                                                    ],
                                                    "type": "object"
                                                },
                                                "iscsi": {
                                                    "properties": {
                                                        "chapAuthDiscovery": {
                                                            "type": "boolean"
                                                        },
                                                        "chapAuthSession": {
                                                            "type": "boolean"
                                                        },
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "initiatorName": {
                                                            "type": "string"
                                                        },
                                                        "iqn": {
                                                            "type": "string"
                                                        },
                                                        "iscsiInterface": {
                                                            "type": "string"
                                                        },
                                                        "lun": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "portals": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "targetPortal": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "iqn",
                                                        "lun",
                                                        "targetPortal"
                                                    ],
                                                    "type": "object"
                                                },
                                                "name": {
                                                    "type": "string"
                                                },
                                                "nfs": {
                                                    "properties": {
                                                        "path": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "server": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "path",
                                                        "server"
                                                    ],
                                                    "type": "object"
                                                },
                                                "persistentVolumeClaim": {
                                                    "properties": {
                                                        "claimName": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        }
                                                    },
                                                    "required": [
                                                        "claimName"
                                                    ],
                                                    "type": "object"
                                                },
                                                "photonPersistentDisk": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "pdID": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "pdID"
                                                    ],
                                                    "type": "object"
                                                },
                                                "portworxVolume": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "volumeID": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "volumeID"
                                                    ],
                                                    "type": "object"
                                                },
                                                "projected": {
                                                    "properties": {
                                                        "defaultMode": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "sources": {
                                                            "items": {
                                                                "properties": {
                                                                    "configMap": {
                                                                        "properties": {
                                                                            "items": {
                                                                                "items": {
                                                                                    "properties": {
                                                                                        "key": {
                                                                                            "type": "string"
                                                                                        },
                                                                                        "mode": {
                                                                                            "format": "int32",
                                                                                            "type": "integer"
                                                                                        },
                                                                                        "path": {
                                                                                            "type": "string"
                                                                                        }
                                                                                    },
                                                                                    "required": [
                                                                                        "key",
                                                                                        "path"
                                                                                    ],
                                                                                    "type": "object"
                                                                                },
                                                                                "type": "array"
                                                                            },
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "downwardAPI": {
                                                                        "properties": {
                                                                            "items": {
                                                                                "items": {
                                                                                    "properties": {
                                                                                        "fieldRef": {
                                                                                            "properties": {
                                                                                                "apiVersion": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "fieldPath": {
                                                                                                    "type": "string"
                                                                                                }
                                                                                            },
                                                                                            "required": [
                                                                                                "fieldPath"
                                                                                            ],
                                                                                            "type": "object"
                                                                                        },
                                                                                        "mode": {
                                                                                            "format": "int32",
                                                                                            "type": "integer"
                                                                                        },
                                                                                        "path": {
                                                                                            "type": "string"
                                                                                        },
                                                                                        "resourceFieldRef": {
                                                                                            "properties": {
                                                                                                "containerName": {
                                                                                                    "type": "string"
                                                                                                },
                                                                                                "divisor": {
                                                                                                    "anyOf": [
                                                                                                        {
                                                                                                            "type": "integer"
                                                                                                        },
                                                                                                        {
                                                                                                            "type": "string"
                                                                                                        }
                                                                                                    ],
                                                                                                    "pattern": "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$",
                                                                                                    "x-kubernetes-int-or-string": true
                                                                                                },
                                                                                                "resource": {
                                                                                                    "type": "string"
                                                                                                }
                                                                                            },
                                                                                            "required": [
                                                                                                "resource"
                                                                                            ],
                                                                                            "type": "object"
                                                                                        }
                                                                                    },
                                                                                    "required": [
                                                                                        "path"
                                                                                    ],
                                                                                    "type": "object"
                                                                                },
                                                                                "type": "array"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "secret": {
                                                                        "properties": {
                                                                            "items": {
                                                                                "items": {
                                                                                    "properties": {
                                                                                        "key": {
                                                                                            "type": "string"
                                                                                        },
                                                                                        "mode": {
                                                                                            "format": "int32",
                                                                                            "type": "integer"
                                                                                        },
                                                                                        "path": {
                                                                                            "type": "string"
                                                                                        }
                                                                                    },
                                                                                    "required": [
                                                                                        "key",
                                                                                        "path"
                                                                                    ],
                                                                                    "type": "object"
                                                                                },
                                                                                "type": "array"
                                                                            },
                                                                            "name": {
                                                                                "type": "string"
                                                                            },
                                                                            "optional": {
                                                                                "type": "boolean"
                                                                            }
                                                                        },
                                                                        "type": "object"
                                                                    },
                                                                    "serviceAccountToken": {
                                                                        "properties": {
                                                                            "audience": {
                                                                                "type": "string"
                                                                            },
                                                                            "expirationSeconds": {
                                                                                "format": "int64",
                                                                                "type": "integer"
                                                                            },
                                                                            "path": {
                                                                                "type": "string"
                                                                            }
                                                                        },
                                                                        "required": [
                                                                            "path"
                                                                        ],
                                                                        "type": "object"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        }
                                                    },
                                                    "required": [
                                                        "sources"
                                                    ],
                                                    "type": "object"
                                                },
                                                "quobyte": {
                                                    "properties": {
                                                        "group": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "registry": {
                                                            "type": "string"
                                                        },
                                                        "tenant": {
                                                            "type": "string"
                                                        },
                                                        "user": {
                                                            "type": "string"
                                                        },
                                                        "volume": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "registry",
                                                        "volume"
                                                    ],
                                                    "type": "object"
                                                },
                                                "rbd": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "image": {
                                                            "type": "string"
                                                        },
                                                        "keyring": {
                                                            "type": "string"
                                                        },
                                                        "monitors": {
                                                            "items": {
                                                                "type": "string"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "pool": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "user": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "image",
                                                        "monitors"
                                                    ],
                                                    "type": "object"
                                                },
                                                "scaleIO": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "gateway": {
                                                            "type": "string"
                                                        },
                                                        "protectionDomain": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "sslEnabled": {
                                                            "type": "boolean"
                                                        },
                                                        "storageMode": {
                                                            "type": "string"
                                                        },
                                                        "storagePool": {
                                                            "type": "string"
                                                        },
                                                        "system": {
                                                            "type": "string"
                                                        },
                                                        "volumeName": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "gateway",
                                                        "secretRef",
                                                        "system"
                                                    ],
                                                    "type": "object"
                                                },
                                                "secret": {
                                                    "properties": {
                                                        "defaultMode": {
                                                            "format": "int32",
                                                            "type": "integer"
                                                        },
                                                        "items": {
                                                            "items": {
                                                                "properties": {
                                                                    "key": {
                                                                        "type": "string"
                                                                    },
                                                                    "mode": {
                                                                        "format": "int32",
                                                                        "type": "integer"
                                                                    },
                                                                    "path": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "key",
                                                                    "path"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "optional": {
                                                            "type": "boolean"
                                                        },
                                                        "secretName": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "storageos": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "readOnly": {
                                                            "type": "boolean"
                                                        },
                                                        "secretRef": {
                                                            "properties": {
                                                                "name": {
                                                                    "type": "string"
                                                                }
                                                            },
                                                            "type": "object"
                                                        },
                                                        "volumeName": {
                                                            "type": "string"
                                                        },
                                                        "volumeNamespace": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "vsphereVolume": {
                                                    "properties": {
                                                        "fsType": {
                                                            "type": "string"
                                                        },
                                                        "storagePolicyID": {
                                                            "type": "string"
                                                        },
                                                        "storagePolicyName": {
                                                            "type": "string"
                                                        },
                                                        "volumePath": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "required": [
                                                        "volumePath"
                                                    ],
                                                    "type": "object"
                                                }
                                            },
                                            "required": [
                                                "name"
                                            ],
                                            "type": "object"
                                        },
                                        "type": "array"
                                    }
                                },
                                "required": [
                                    "driver",
                                    "executor",
                                    "sparkVersion",
                                    "type"
                                ],
                                "type": "object"
                            },
                            "status": {
                                "properties": {
                                    "applicationState": {
                                        "properties": {
                                            "errorMessage": {
                                                "type": "string"
                                            },
                                            "state": {
                                                "type": "string"
                                            }
                                        },
                                        "required": [
                                            "state"
                                        ],
                                        "type": "object"
                                    },
                                    "driverInfo": {
                                        "properties": {
                                            "podName": {
                                                "type": "string"
                                            },
                                            "webUIAddress": {
                                                "type": "string"
                                            },
                                            "webUIIngressAddress": {
                                                "type": "string"
                                            },
                                            "webUIIngressName": {
                                                "type": "string"
                                            },
                                            "webUIPort": {
                                                "format": "int32",
                                                "type": "integer"
                                            },
                                            "webUIServiceName": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "executionAttempts": {
                                        "format": "int32",
                                        "type": "integer"
                                    },
                                    "executorState": {
                                        "additionalProperties": {
                                            "type": "string"
                                        },
                                        "type": "object"
                                    },
                                    "lastSubmissionAttemptTime": {
                                        "format": "date-time",
                                        "nullable": true,
                                        "type": "string"
                                    },
                                    "sparkApplicationId": {
                                        "type": "string"
                                    },
                                    "submissionAttempts": {
                                        "format": "int32",
                                        "type": "integer"
                                    },
                                    "submissionID": {
                                        "type": "string"
                                    },
                                    "terminationTime": {
                                        "format": "date-time",
                                        "nullable": true,
                                        "type": "string"
                                    }
                                },
                                "required": [
                                    "driverInfo"
                                ],
                                "type": "object"
                            }
                        },
                        "required": [
                            "metadata",
                            "spec"
                        ],
                        "type": "object"
                    }
                }
            }
        ]
    },
    "status": {
        "acceptedNames": {
            "kind": "",
            "plural": ""
        },
        "conditions": [],
        "storedVersions": []
    }
}