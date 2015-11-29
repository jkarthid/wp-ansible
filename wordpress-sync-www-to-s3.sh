#!/bin/bash

# It invokes the Ansible playbook which synchronises the Wordpress website from /var/www/html/ to S3

./prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/bin/ansible/sync-to-s3.yml
