#!/bin/bash

./prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/runtime/ansible/wordpress/stopcron.yml
