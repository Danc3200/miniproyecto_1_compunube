#!/bin/bash

echo "instalando programas"
sudo apt-get update
sudo apt-get install -y net-tools
sudo apt install -y git
sudo apt install -y nodejs
sudo apt install -y npm
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y consul
git clone https://github.com/omondragon/consulService
cd /home/vagrant/consulService/app
sed -i 's/'192.168.100.3'/'172.20.20.10'/g' index.js
npm install consul express
cd /

echo "instalando HAProxy"
sudo apt install -y haproxy 
sudo cp /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
service haproxy reload

sudo cp /vagrant/web-service.hcl /etc/consul.d/

echo "configurando cluster consul"

echo "$(consul agent   -server   -bootstrap-expect=1   -data-dir=/tmp/consul   -node=agent-one   -retry-join "172.20.20.11"   -bind=172.20.20.10   -enable-script-checks=true   -ui   -client=0.0.0.0   -config-dir=/etc/consul.d)" & "$(node /home/vagrant/consulService/app/index.js 3000)"