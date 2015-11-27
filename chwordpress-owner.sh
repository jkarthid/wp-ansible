#!/bin/bash

date

/Users/tedonema/bin/prepare-aws-server-list.sh default

NUMOFLINES=$(wc -l < /etc/ansible/hosts)

if [[ $NUMOFLINES -eq 1 ]]; then 
  echo "The /etc/ansible/hosts file does not contain any server names";
  echo "Check the /Users/tedonema/bin/prepare-aws-server-list.sh file. Exiting with error..."
  exit 1
fi
/usr/local/bin/ansible-playbook ~/runtime/ansible/wordpress/assign-apache-owner.yml
