#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: $0 key_file.pem docker.yaml"; exit 1; }

ansible-playbook -i hosts.ini -u ubuntu -v -b --ask-become-pass --become-method=sudo --key-file=$1 $2