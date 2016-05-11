#!/usr/bin/env bash

echo "installing a bunch of prerequisites"
apt-get -y install dnsutils # install dig
apt-get -y install curl
apt-get -y install sudo
echo "done with prerequisites"

wget https://github.com/DSPN/install-datastax/archive/master.zip
apt-get -y install unzip
unzip master.zip
cd install-datastax-master/bin

cloud_type="gke"
seed_nodes_dns_names=$SEED_NODE_SERVICE

echo "Configuring nodes with the settings:"
echo cloud_type $cloud_type
echo seed_nodes_dns_names $seed_nodes_dns_names

./opscenter.sh $cloud_type $seed_nodes_dns_names

sleep 3600