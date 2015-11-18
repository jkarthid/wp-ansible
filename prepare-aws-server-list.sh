#!/bin/bash

function usage()
{
cat <<- _EOF_
Usage (* denotes mandatory arguments): $0 <profile>*
Where: 
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials
_EOF_
}

inventory=/etc/ansible/hosts
profile=$1

if [ -z "$1" ]
then
  usage
  exit 1
fi

echo "[wordpress]" > $inventory
aws ec2 describe-instances --profile $profile | grep PublicIpAddress | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' >> $inventory 

echo "file: $inventory has been written"

exit 0
