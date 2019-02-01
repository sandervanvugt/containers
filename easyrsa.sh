#!/bin/bash
# this script is based on the documentation in https://www.projectatomic.io/docs/gettingstarted
# 

echo enter the IP address of the intended kubernetes master
read MASTER_IP

# download and initialize easyrsa
curl -L -O https://storage.googleapis.com/kubernetes-release/easy-rsa/easy-rsa.tar.gz
tar xvf easy-rsa.tar.gz
cd easy-rsa-master/easyrsa3
./easyrsa init-pki

# generate the CA
./easyrsa --batch "--req-cn=${MASTER_IP}$`date +%s`" build-ca nopass

# generate server certificate and key
./easyrsa --subject-alt-name="IP:${MASTER_IP}" build-server-full server nopass

# copy certificates to the appropriate location
mkdir /etc/kubernetes/certs
for i in {pki/ca.crt,pki/issued/server.crt,pki/private/server.key}; do cp $i /etc/kubernetes/certs; done
chown -R kube:kube /etc/kubernetes/certs
