#!/bin/bash

date

/Users/tedonema/bin/prepare-aws-server-list.sh default

/usr/local/bin/ansible-playbook ~/runtime/ansible/wordpress/assign-apache-owner.yml
