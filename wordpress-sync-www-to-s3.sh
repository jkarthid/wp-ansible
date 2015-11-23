#!/bin/bash

./prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/runtime/ansible/wordpress/sync-to-s3.yml
