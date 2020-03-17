#!/bin/bash 
kubectl delete -f kuard_app.yaml
kubectl delete -f cpx.yaml
eksctl delete cluster --name letsencrypt-test-isha

