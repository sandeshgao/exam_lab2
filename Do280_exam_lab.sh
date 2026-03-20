#!/bin/bash
#for newtwork lable need to set manually fro pod

#Question 1
#NA

#Question 2
#NA

#Question 3
#NA

#Question 4
#NA

#Question 5
#NA

#Question 6
oc new-project world
oc new-app --name scale-q6-manually registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n world
#oc new-app --name scale-q6-manually httpd:latest -n world

#Question 7
oc new-project scaling
oc new-app --name autoscale-q7 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n scaling
#oc new-app --name autoscale-q7 httpd:latest -n scaling

#Question 8
oc new-project math
oc new-app --name secret-q8 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n math
#oc new-app --name secret-q8 httpd:latest -n math

#Question 9
#NA  Sector missmatch troubleshooting

#Question 10
oc new-project oxcart
oc new-app --name hello-q10 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n oxcart
#oc new-app --name hello-q10 httpd:latest -n oxcart

#Question 11
oc new-project qed
oc new-app --name serviceaccount-anyuid-q11 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n qed
#oc new-app --name serviceaccount-anyuid-q11 httpd:latest -n qed

#Question 12
#Troubleshooting question.permission issue.assined serviceaccount with anyuid scc will resove the issue

#Question 13
oc new-project bluebook
oc apply -f apache-bluebook-deploy.yaml -n bluebook

#Question 14
#NA

#Question 15
#NA

#Question 16
#NA

#Question 17
#NA

#Question 18
#NA

#Question 19
#NA

#Question 20
oc new-project database
oc new-project checker
oc label ns/checker team=devsecops
oc new-app --name dbapp1 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n database
oc new-app --name checkerapp2 registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7 -n checker
oc create -f deny-all-ingress.yaml
#oc label pod dbapp1-<podname> network.openshift.io/policy-group=mysql -n database
#oc label pod checkerapp2-<podname> env=db -n checker

#Question 21
#NA

#Question 22
oc new-project tuesday
oc new-app --name probeapp registry.ocp4.example.com:8443/rhscl/httpd-24-rhel7
