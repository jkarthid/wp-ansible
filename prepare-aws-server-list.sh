#!/bin/bash

function usage()
{
cat <<- _EOF_
Usage (* denotes mandatory arguments): $0 <profile>*
Where: 
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials
_EOF_
}

ANSIBLE_CONFIG_HOME=~/runtime/ansible
inventory=$ANSIBLE_CONFIG_HOME/hosts

profile=$1

if [ -z "$1" ]
then
  usage
  exit 1
fi

if [ ! -d "$ANSIBLE_CONFIG_HOME" ]; then
    echo "Ansible config home: $ANSIBLE_CONFIG_HOME does not exist...Creating folder"
    mkdir -p "$ANSIBLE_CONFIG_HOME"
fi

if [ ! -f "$inventory" ]; then
    echo "Inventory file $inventory does not exist. Creating one..."
    touch "$inventory"
fi

echo "[wordpress]" > $inventory
/usr/local/bin/aws ec2 describe-instances --profile $profile | grep PublicIpAddress | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' >> $inventory 

echo "file: $inventory has been written"

exit 0
