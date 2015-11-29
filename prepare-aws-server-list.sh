#!/bin/bash

#
# Writes the Ansible hosts file
#

#
# Defines how this script should be used
#
function usage()
{
cat <<- _EOF_
Usage (* denotes mandatory arguments): $0 <profile>*
Where: 
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials
_EOF_
}

ANSIBLE_CONFIG_HOME=$HOME/runtime/ansible
inventory=$ANSIBLE_CONFIG_HOME/hosts

profile=$1

# Profile is mandatory
if [ -z "$profile" ]
then
  usage
  exit 1
fi

# Creates the Ansible configuration directory if it doesn't exist
if [ ! -d "$ANSIBLE_CONFIG_HOME" ]; then
    echo "Ansible config home: $ANSIBLE_CONFIG_HOME does not exist...Creating folder"
    mkdir -p "$ANSIBLE_CONFIG_HOME"
fi

# It creates the inventory file if it doesn't exist
if [ ! -f "$inventory" ]; then
    echo "Inventory file $inventory does not exist. Creating one..."
    touch "$inventory"
fi

# Since we're writing the hosts file each time, we start by adding the Ansible line 
# My ansible scripts run on the "wordpress" configuration. Change this to your choice
echo "[wordpress]" > $inventory

# Uses the AWS CLI aws ec2 describe-instances command to retrieve the IP addresses of all my AWS boxes and writes the results to the inventory file
/usr/local/bin/aws ec2 describe-instances --profile $profile | grep PublicIpAddress | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' >> $inventory 

echo "file: $inventory has been written"

exit 0
