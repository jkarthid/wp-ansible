#!/bin/bash

#
# It ssh into the IP passed as argument
#
box=$1

if [ -z "$1" ]
then
  echo "No IP passed. Exiting with error"
  exit 1
fi

ssh ec2-user@$box
