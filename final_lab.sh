#!/bin/bash
#Lab for Exam preparation

for project in rocky darpa world scaling math oxcart qed bluebook apple venus cron-test page database checker tuesday; do
    oc new-project $project;
done

for project in world scaling math tuesday; do
    oc new-app --name=nginx -n $project --image=registry.ocp4.example.com:8443/redhattraining/hello-world-nginx;
done

#For Q6
oc label node/master01 star=Trek && oc patch deployment/nginx -p '{"spec": {"template": {"spec": {"nodeSelector": {"star": "trek"}}}}}' -n world

oc scale deployment/nginx --replicas=0 -n world
oc scale deployment/nginx --replicas=1 -n world

#For Q9
oc patch svc/nginx -p '{"spec": {"selector": {"deployment": "Nginx"}}}' -n math
oc scale deployment/nginx --replicas=0 -n math
oc scale deployment/nginx --replicas=1 -n math

#For Q10 Secure Route
oc new-app --name=hello --image=registry.ocp4.example.com:8443/redhattraining/hello-world-nginx -n oxcart && \
oc expose svc/hello --name=oxcart -n oxcart

#For Q12 Attach Service Account and it should have anyuid scc set
oc new-app --name=gitlab --image=registry.ocp4.example.com:8443/redhattraining/gitlab-ce:8.4.3-ce.0 -n qed

#For Q13
for project in bluebook; do
    oc new-app --name=scale --image=quay.io/redhattraining/scaling -n $project;
    oc patch deployment/scale -p '{"spec": {"template": {"spec": {"containers": [{"name": "scale", "resources": {"requests": {"memory": "20Gi"}}}]}}}}' -n $project;
    oc scale deployment/scale --replicas=0 -n $project && oc scale deployment/scale --replicas=1 -n $project;
done

#For Q21 Network policy
oc create deployment checker --image=registry.ocp4.example.com:8443/redhattraining/hello-world-nginx -n checker

#Keep deny-all.yaml in /root
oc create -f deny_all_ingress.yaml -n database
oc new-app --name=db --image=registry.ocp4.example.com:8443/redhattraining/hello-world-nginx -n database
oc label pods --all networking.openshift.io/policy-worker=mysql -n database
oc label pods --all deployment-webserver -n checker
oc label ns/checker team=devsecops
