package tpls

import (
	 appsv1 "k8s.io/api/apps/v1"
 	 corev1 "k8s.io/api/core/v1"
)

isworkflow: true

//  主对象
generic:{}

#status: {
	expr: string
	key: string
    crname: string
}
myapp_v1_redis_input:{
	name: string
	ns: string | *"default"
}

// workflow 是固定节点名称
workflow: {
    step0:{ // 节点固定
    	action: string
    }
    step1: {
		body: appsv1.#Deployment & {
			apiVersion: "apps/v1"
			kind: "Deployment"
			metadata: {
	 			name: myapp_v1_redis_input.name
	 			namespace: myapp_v1_redis_input.ns
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
	 		spec:{
				selector: matchLabels: app: myapp_v1_redis_input.name
				replicas: 1
				template: {
					metadata: labels: app: myapp_v1_redis_input.name
					spec: containers: [{
						name:            myapp_v1_redis_input.name+"-container"
						image:           "docker.io/library/redis:5-alpine"
						imagePullPolicy: "IfNotPresent"
						ports: [{
							containerPort: 6379
						}]
					}]
			    }
	 		}
		}
		action: step0.action
		cr: generic
		status: #status & {
			expr: "status.availableReplicas"
			key: "replicas"
			crname: "cr"
		}
		order: string
	}
	step2: {
		body: corev1.#Service & {
		  	apiVersion: "v1"
			kind: "Service"
			metadata:{
				name: myapp_v1_redis_input.name+"-svc"
				namespace: myapp_v1_redis_input.ns
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
			spec:{
				selector:{
					app: myapp_v1_redis_input.name
				}
				ports: [
					{
						protocol: "TCP"
						port: 6379
						targetPort: 6379
					}
				]
			}
		}
		action: step0.action
		cr: generic
		status: #status & {
			expr: "spec.clusterIP"
			key: "ip"
			crname: "cr"
		}
		order: step1.order
	}
}