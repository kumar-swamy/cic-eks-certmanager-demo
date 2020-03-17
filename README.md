# Creating an EKS clsuter with cert-manager and CIC installed
1. Edit eksctl.sh to update the region where you want to create the cluster and SSH key pair name 
2. Edit update_route53.sh script to update the hostedzoneId of your hosted DNS zone 
3. Run bringup_cluster.sh from the shell 
```
      ./bringup_cluster.sh
```
4. There are four clusterissuer YAML files located in the repo. 
   clusterissuer-letsencrypt-staging.yaml -> HTTP01 challenge , staging server
   clusterissuer-letsencrypt-prod.yaml -> HTTP01 challenge, production server
   clusterissuer-dns-challenge-staging.yaml -> DNS01 challenge, staging server
   clusterissuer-dns-challenge-prod.yaml -> DNS01 challenge, production server
 
   edit the YAML files to update the valid email id in the ```email``` field. 
5. Install one of the staging or production cluster issuer (HTTP01 or DNS01) using kubectl 
```
kubectl apply -f clusterissuer-letsencrypt-staging.yaml 
``` 
6.  Install the https version of application using  kubectl 
```
kubectl apply -f kuard_app_tls_staging.yaml
```
7. Access the domain using https

 Note: You may have to updaate the Loadbalancer health check to use node port correspoding to https of CPX. 

# Deleting the EKS cluster
1. run delete_cluster.sh 
```
delete_cluster.sh
``` 
 Note: If not getting deleted, manually delete the security group using console and delete the EKS cluster again. 

