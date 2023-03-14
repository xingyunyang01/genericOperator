package tpls

import (
	"cucloud.com/operator/resources/spark"
	corev1 "k8s.io/api/core/v1"
	appsv1 "k8s.io/api/apps/v1"
	rbacv1 "k8s.io/api/rbac/v1"
	batchv1 "k8s.io/api/batch/v1"
)

isworkflow: true

//  主对象
generic:{}

emr_v1_spark_input:{
	name: string
	ns: string | *"spark"
	sparkdefaults: string
	sparkenv: string
}

// workflow 是固定节点名称
workflow: {
    step0:{ // 节点固定
    	action: string
    }
    step1: {
		body: spark.sparkApplication
		action: step0.action
		order: string
	}
    step2: {
		body: spark.scheduledSparkApplication
		action: step0.action
		order: step1.order
	}
    step3: {
		body: corev1.#Namespace & {
			apiVersion: "v1",
    		kind: "Namespace",
    		metadata: {
        		name: "spark"
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
    		}
		}
		action: step0.action
		order: step2.order
	}
    step4: {
		body: corev1.#ServiceAccount & {
			apiVersion: "v1",
			kind: "ServiceAccount",
			metadata: {
				name: "spark",
				namespace: "spark",
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			}
		}
		action: step0.action
		order: step3.order
	}
    step5: {
		body: rbacv1.#Role & {
			apiVersion: "rbac.authorization.k8s.io/v1",
    		kind: "Role",
    		metadata: {
				namespace: "spark",
				name: "spark-role"
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			},
			rules: [
				{
					apiGroups: [
						""
					],
					resources: [
						"pods"
					],
					verbs: [
						"*"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"services"
					],
					verbs: [
						"*"
					]
				}
			]
		}
		action: step0.action
		order: step4.order
	}
    step6: {
		body: rbacv1.#RoleBinding & {
			apiVersion: "rbac.authorization.k8s.io/v1",
			kind: "RoleBinding",
			metadata: {
				name: "spark-role-binding",
				namespace: "spark"
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			},
			subjects: [
				{
					kind: "ServiceAccount",
					name: "spark",
					namespace: "spark"
				}
			],
			roleRef: {
				kind: "Role",
				name: "spark-role",
				apiGroup: "rbac.authorization.k8s.io"
			}
		}
		action: step0.action
		order: step5.order
	}
    step7: {
		body: corev1.#Namespace & {
			apiVersion: "v1",
			kind: "Namespace",
			metadata: {
				name: "spark-operator"
			}
		}
		action: step0.action
		order: step6.order
	}
    step8: {
		body: corev1.#ServiceAccount & {
			apiVersion: "v1",
			kind: "ServiceAccount",
			metadata: {
				name: "sparkoperator",
				namespace: "spark-operator"
			}
		}
		action: step0.action
		order: step7.order
	}
	step9: {
		body: rbacv1.#ClusterRole & {
			apiVersion: "rbac.authorization.k8s.io/v1",
			kind: "ClusterRole",
			metadata: {
				name: "sparkoperator"
			},
			rules: [
				{
					apiGroups: [
						""
					],
					resources: [
						"pods"
					],
					verbs: [
						"*"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"configmaps"
					],
					verbs: [
						"*"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"services",
						"secrets"
					],
					verbs: [
						"create",
						"get",
						"delete"
					]
				},
				{
					apiGroups: [
						"extensions"
					],
					resources: [
						"ingresses"
					],
					verbs: [
						"create",
						"get",
						"delete"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"nodes"
					],
					verbs: [
						"get"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"resourcequotas"
					],
					verbs: [
						"get",
						"list",
						"watch"
					]
				},
				{
					apiGroups: [
						""
					],
					resources: [
						"events"
					],
					verbs: [
						"create",
						"update",
						"patch"
					]
				},
				{
					apiGroups: [
						"apiextensions.k8s.io"
					],
					resources: [
						"customresourcedefinitions"
					],
					verbs: [
						"create",
						"get",
						"update",
						"delete"
					]
				},
				{
					apiGroups: [
						"admissionregistration.k8s.io"
					],
					resources: [
						"mutatingwebhookconfigurations",
						"validatingwebhookconfigurations"
					],
					verbs: [
						"create",
						"get",
						"update",
						"delete"
					]
				},
				{
					apiGroups: [
						"sparkoperator.k8s.io"
					],
					resources: [
						"sparkapplications",
						"scheduledsparkapplications",
						"sparkapplications/status",
						"scheduledsparkapplications/status"
					],
					verbs: [
						"*"
					]
				},
				{
					apiGroups: [
						"scheduling.volcano.sh"
					],
					resources: [
						"podgroups",
						"queues",
						"queues/status"
					],
					verbs: [
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
		action: step0.action
		order: step8.order
	}
	step10: {
		body: rbacv1.#ClusterRoleBinding & {
			apiVersion: "rbac.authorization.k8s.io/v1",
			kind: "ClusterRoleBinding",
			metadata: {
				name: "sparkoperator"
			},
			subjects: [
				{
					kind: "ServiceAccount",
					name: "sparkoperator",
					namespace: "spark-operator"
				}
			],
			roleRef: {
				kind: "ClusterRole",
				name: "sparkoperator",
				apiGroup: "rbac.authorization.k8s.io"
			}
		}
		action: step0.action
		order: step9.order
	}
	step11: {
		body: rbacv1.#ClusterRole & {
			apiVersion: "rbac.authorization.k8s.io/v1",
			kind: "ClusterRole",
			metadata: {
				labels: {
					"rbac.authorization.k8s.io/aggregate-to-admin": "true"
				},
				name: "sparkoperator-aggregate-to-admin"
			},
			rules: [
				{
					apiGroups: [
						"sparkoperator.k8s.io"
					],
					resources: [
						"sparkapplications",
						"scheduledsparkapplications"
					],
					verbs: [
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
		action: step0.action
		order: step10.order
	}
	step12: {
		body: appsv1.#Deployment & {
			apiVersion: "apps/v1",
			kind: "Deployment",
			metadata: {
				name: "sparkoperator",
				namespace: "spark-operator",
				labels: {
					"app.kubernetes.io/name": "sparkoperator",
					"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
				},
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			},
			spec: {
				replicas: 1,
				selector: {
					matchLabels: {
						"app.kubernetes.io/name": "sparkoperator",
						"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
					}
				},
				strategy: {
					"type": "Recreate"
				},
				template: {
					metadata: {
						labels: {
							"app.kubernetes.io/name": "sparkoperator",
							"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
						}
					},
					spec: {
						serviceAccountName: "sparkoperator",
						volumes: [
							{
								name: "webhook-certs",
								secret: {
									secretName: "spark-webhook-certs"
								}
							}
						],
						containers: [
							{
								name: "sparkoperator",
								image: "xingyunyang/spark-operator:v1beta2-1.3.5-3.1.3",
								imagePullPolicy: "Always",
								args: [
									"-logtostderr",
									"-enable-webhook=true",
                            		"-v=2"
								],
								volumeMounts: [
									{
										name: "webhook-certs",
										mountPath: "/etc/webhook-certs"
									}
								]
							}
						]
					}
				}
			}
		}
		action: step0.action
		order: step11.order
	}
	step13: {
		body: batchv1.#Job & {
			apiVersion: "batch/v1",
			kind: "Job",
			metadata: {
				name: "sparkoperator-init",
				namespace: "spark-operator",
				labels: {
					"app.kubernetes.io/name": "sparkoperator",
					"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
				}
			},
			spec: {
				backoffLimit: 3,
				template: {
					metadata: {
						labels: {
							"app.kubernetes.io/name": "sparkoperator",
							"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
						}
					},
					spec: {
						serviceAccountName: "sparkoperator",
						restartPolicy: "Never",
						containers: [
							{
								name: "main",
								image: "xingyunyang/spark-operator:v1beta2-1.3.5-3.1.3",
								imagePullPolicy: "IfNotPresent",
								command: [
									"/usr/bin/gencerts.sh",
									"-p"
								]
							}
						]
					}
				}
			}
		}
		action: step0.action
		order: step12.order
	}
	step14: {
		body: corev1.#Service & {
			kind: "Service",
			apiVersion: "v1",
			metadata: {
				name: "spark-webhook",
				namespace: "spark-operator",
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			},
			spec: {
				ports: [
					{
						port: 443,
						targetPort: 8080,
						name: "webhook"
					}
				],
				selector: {
					"app.kubernetes.io/name": "sparkoperator",
					"app.kubernetes.io/version": "v1beta2-1.3.5-3.1.3"
				}
			}
		}
		action: step0.action
		order: step13.order
	}
	step15: {
		body: corev1.#ConfigMap & {
			apiVersion: "v1"
			kind:       "ConfigMap"
			metadata: {
				name: emr_v1_spark_input.name+"-cm"
				namespace: emr_v1_spark_input.ns
				ownerReferences: [
					{
						apiVersion: generic.apiVersion
						kind: generic.kind
						name: generic.metadata.name
						uid: generic.metadata.uid
						controller: true
					}
				]
			}
			data: {
				"spark-defaults.conf": emr_v1_spark_input.sparkdefaults
				"spark-env.sh": emr_v1_spark_input.sparkenv
			}
		}
		action: step0.action
		order: step13.order
	}
}