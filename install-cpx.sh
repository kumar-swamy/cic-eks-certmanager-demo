#!/bin/bash
kubectl apply -f cpx.yaml
kubectl wait --for=condition=Ready -l app=cpx-ingress pod
