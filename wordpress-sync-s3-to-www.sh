#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Current directory: $CURRENT_DIR"

# It invokes the Ansible playbook which synchronises all my Wordpress content from S3 to /var/www/html/

$CURRENT_DIR/prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook $CURRENT_DIR/ansible/sync-from-s3.yml
