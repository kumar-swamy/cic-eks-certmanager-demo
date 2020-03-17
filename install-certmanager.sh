#!/bin/bash
kubectl create namespace cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.13.0/cert-manager.yaml
kubectl wait --for=condition=Ready -l app=cert-manager pod -n cert-manager
