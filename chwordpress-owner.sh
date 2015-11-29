#!/bin/bash

date

$HOME/bin/prepare-aws-server-list.sh default

inventory=$HOME/runtime/ansible/hosts

NUMOFLINES=$(wc -l < $inventory)

if [[ $NUMOFLINES -eq 1 ]]; then 
  echo "The $inventory file does not contain any server names";
  echo "Check the $HOME/bin/prepare-aws-server-list.sh file. Exiting with error..."
  exit 1
fi

/usr/local/bin/ansible-playbook $HOME/bin/ansible/assign-apache-owner.yml
