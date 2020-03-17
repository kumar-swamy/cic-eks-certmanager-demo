# Creating an EKS clsuter with cert-manager and CIC installed

1. Edit update_route53.sh script to update the hostedzoneId of your hosted DNS zone 
2. Run bringup_cluster.sh from the shell 
```
      ./bringup_cluster.sh
```
3. Install one of the cluster issuer (HTTP01 or DNS01) using kubectl 
```
kubectl apply -f clusterissuer-letsencrypt-staging.yaml 
``` 
4.  Install the Https version of ingress usig kubectl 
```
kubectl apply -f kuard_app_tls_staging.yaml
```
5. Access the domain using https

Note: You may have to updaate the Loadbalancer health check to use node port correspoding to https of CPX. 

# Deleting the EKS cluster
1. run delete_cluster.sh 
```
delete_cluster.sh
``` 
Note: If not getting deleted, manually delete the security group using console and delete the EKS cluster again. 

