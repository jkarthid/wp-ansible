#!/bin/bash

./prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/bin/ansible/sync-from-s3.yml
