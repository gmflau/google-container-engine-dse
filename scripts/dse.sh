#!/usr/bin/env bash

echo "installing a bunch of prerequisites"
apt-get -y install dnsutils # install dig
apt-get -y install sudo
apt-get -y install adduser curl lsb-base procps zlib1g gzip sysstat ntp bash tree
apt-get -y install python python-support
apt-get -y install apt-transport-https
echo "done with prerequisites"

wget https://github.com/DSPN/install-datastax/archive/master.zip
apt-get -y install unzip
unzip master.zip
cd install-datastax-master/bin

cloud_type="gke"
seed_nodes_dns_names=$SEED_NODE_SERVICE
data_center_name="dc0"

echo "Configuring nodes with the settings:"
echo cloud_type $cloud_type
echo seed_nodes_dns_names $seed_nodes_dns_names
echo data_center_name $data_center_name

./dse.sh $cloud_type $seed_nodes_dns_names $data_center_name

sleep 3600