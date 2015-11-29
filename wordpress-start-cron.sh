#!/bin/bash

# It invokes the Ansible playbook to start the cron on all my AWS instances

$HOME/bin/prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/bin/ansible/startcron.yml
