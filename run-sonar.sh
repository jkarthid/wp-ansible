#! /bin/bash

function usage() {

cat <<-EOF

  usage: $0 (start|stop)
EOF

}

if [ -z "$1" ]
then
  usage
  exit 1
fi

action="$1"

echo "Action: $action"

if [ "$action" != "start" ] && [ "$action" != "stop" ]
then
  usage
  exit 1
fi

/Users/tedonema/runtime/sonarqube-4.3.2/bin/macosx-universal-64/sonar.sh "$action"

exit 0
