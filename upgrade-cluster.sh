#!/bin/bash

##cp this script into kubespray directory

if [ $1 == "" ] || [ $2 == "" ];
then
    echo "Usage: ./upgrade-c;uster.sh <inventory> <version>";
    exit;
fi
inventory=$1
version=$2
echo "ansible-playbook cluster.yml -i ${inventory} -e kube_version=${version} -e upgrade_cluster_setup=true"

