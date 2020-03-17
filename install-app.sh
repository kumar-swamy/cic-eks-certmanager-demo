#!/bin/bash
kubectl apply -f kuard_app.yaml
kubectl wait --for=condition=Ready -l app=kuard pod

