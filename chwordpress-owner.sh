#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Current directory: $CURRENT_DIR"

date

$CURRENT_DIR/prepare-aws-server-list.sh default

inventory=$HOME/runtime/ansible/hosts

NUMOFLINES=$(wc -l < $inventory)

if [[ $NUMOFLINES -eq 1 ]]; then 
  echo "The $inventory file does not contain any server names";
  echo "Check the $CURRENT_DIR/bin/prepare-aws-server-list.sh file. Exiting with error..."
  exit 1
fi

/usr/local/bin/ansible-playbook $CURRENT_DIR/ansible/assign-apache-owner.yml
