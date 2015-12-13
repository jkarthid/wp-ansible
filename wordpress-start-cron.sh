#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Current directory: $CURRENT_DIR"

# It invokes the Ansible playbook to start the cron on all my AWS instances

#
# Defines how this script should be used
#
function usage()
{
cat <<- _EOF_
Usage: $0 <profile>
Where:
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials. If not passed, it will be defaulted to "default"
_EOF_
}

profile=$1

# Profile is mandatory
if [ -z "$profile" ]
then
  echo "Profile has not been passed. Using 'default'"
  profile=default
fi


$CURRENT_DIR/prepare-aws-server-list.sh $profile

/usr/local/bin/ansible-playbook $CURRENT_DIR/ansible/startcron.yml
