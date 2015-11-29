#!/bin/bash

#
# Defines how this script should be used
#
function usage()
{
cat <<- _EOF_
Usage (* denotes mandatory arguments): $0 <profile>*
Where: 
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials
_EOF_
}

#
# Opens a new terminal window and ssh into the AWS box identified by the argument
# @param box Identifies the IP address of the box to connect to
#
function connect()
{
box=$1
osascript <<-END
  tell application "Terminal.app"
    do script "$HOME/bin/connect-to-box.sh $box"
  end tell
END
}

profile=$1

inventory=$HOME/runtime/ansible/hosts

if [ -z "$profile" ]
then
  usage
  exit 1
fi

# Refreshes the ansible inventory file
$HOME/bin/prepare-aws-server-list.sh $profile

# It ssh into each IP address listed in the inventory file
while read ip; do
  if [[ $ip =~ ^\[.* ]]; then
    echo "Skipping label $ip";
  else
    connect "$ip";
  fi
done < $inventory
