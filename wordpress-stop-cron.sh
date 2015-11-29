#!/bin/bash

$HOME/bin/prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/bin/ansible/stopcron.yml
