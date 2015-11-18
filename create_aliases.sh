#!/bin/sh
echo '-----------------------'
echo 'adding git aliases....'
echo '-----------------------'
echo
git config --global alias.squash "!sh -c 'sh ~/bin/squash.sh \$1 \$2'"
#add your other git aliases setup here
#and here
#etc.
echo '------------------------------------'
echo 'here is your global gitconfig file:'
echo '------------------------------------'
more ~/.gitconfig
echo 
echo
echo '----------------'
echo 'end of script...'
echo '----------------'
