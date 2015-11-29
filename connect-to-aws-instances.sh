#!/bin/bash

function usage()
{
cat <<- _EOF_
Usage (* denotes mandatory arguments): $0 <profile>*
Where: 
<profile> is the AWS profile name which must match an entry in ~/.aws/credentials
_EOF_
}
function connect()
{
box=$1
osascript <<-END
  tell application "Terminal.app"
    do script "~/bin/connect-to-box.sh $box"
  end tell
END
}

profile=$1
inventory=/etc/ansible/hosts

if [ -z "$1" ]
then
  usage
  exit 1
fi

~/bin/prepare-aws-server-list.sh $profile

while read ip; do
  if [[ $ip =~ ^\[.* ]]; then
    echo "Skipping label $ip";
  else
    connect "$ip";
  fi
done < $inventory
