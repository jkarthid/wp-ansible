#!/bin/bash

# It invokes the Ansible playbook which synchronises all my Wordpress content from S3 to /var/www/html/

./prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/bin/ansible/sync-from-s3.yml
