#!/bin/bash
DNS_NAME=$(kubectl get svc cpx-service -o json | jq .status.loadBalancer.ingress[0].hostname)
ELB_ZONE=$(aws elb describe-load-balancers | jq .LoadBalancerDescriptions[0].CanonicalHostedZoneNameID)
aws route53 change-resource-record-sets --hosted-zone-id Z1XU46Y9SOOOJV --change-batch '
{
"Comment": "Update record to reflect new DNSName of fresh deploy",
"Changes": [
{
"Action": "UPSERT",
"ResourceRecordSet": {
"AliasTarget": {
"EvaluateTargetHealth": false,
"HostedZoneId": '"$ELB_ZONE"',
"DNSName": '"$DNS_NAME"'
},
"Type": "A",
"Name": "acme.citrixns.com."
}
}
]
}
'

