#!/bin/bash
echo "$1 ec1" >> /etc/hosts
echo "$2 ec2" >> /etc/hosts
ansible-playbook -i stress-test-inventory.yml stress-test-playbook.yml
