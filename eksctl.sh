#!/bin/bash
eksctl create cluster \
 --name letsencrypt-test \
 --version 1.14 \
 --region ca-central-1 \
 --nodegroup-name standard-workers \
 --node-type t3.small \
 --nodes 2 \
 --nodes-min 1 \
 --nodes-max 2 \
 --ssh-access \
 --ssh-public-key LetsEncryptDemoTest \
 --managed
