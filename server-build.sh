#!/bin/bash

echo $SHELL

[[ ${UID} -ne 0 ]] && echo "Must run as root or using sudo -H" && exit 1

echo "apt update disabled"
#apt-get update -y
python/install-python.sh
ansible/install-ansible.sh
docker/install-docker.sh

ansible-playbook -v -b -i localhost, ansible/server-setup.ansible -e 'ansible_python_interpreter=/usr/bin/python3'

