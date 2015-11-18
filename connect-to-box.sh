#!/bin/bash

box=$1

if [ -z "$1" ]
then
  echo "No IP passed"
  exit 1
fi

ssh ec2-user@$box
