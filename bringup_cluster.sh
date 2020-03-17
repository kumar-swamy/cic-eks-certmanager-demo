#!/bin/bash
echo -e "Installing EKS cluster"
./eksctl.sh
echo -e "EKS cluster installation done"
sleep 2
echo -e "Installing CPX as load balancer"
./install-cpx.sh
echo -e "Installing CPX done"
sleep 5 
echo -e "Updating the route53"
./update_route53.sh
echo -e "Updating the route53 done"
echo -e "Installing cert-manager"
./install-certmanager.sh
echo -e "Installing cert-manager done"
echo -e "Installing a sample app -kuard"
./install-app.sh
echo -e "Installing Kuard app done"
echo -e "Wait for few minutes for the DNS update to be done"
