#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Current directory: $CURRENT_DIR"

# It invokes the Ansible playbook which synchronises the Wordpress website from /var/www/html/ to S3

$CURRENT_DIR/prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook $CURRENT_DIR/ansible/sync-to-s3.yml
