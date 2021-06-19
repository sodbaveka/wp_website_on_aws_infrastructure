#!/bin/bash
echo "$1 ec1" >> /etc/hosts
echo "$2 ec2" >> /etc/hosts
ansible-playbook -i stress-test-inventory.ini stress-test-playbook.yaml 
