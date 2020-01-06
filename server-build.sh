#!/usr/bin/env bash

echo $SHELL

[[ ${UID} -ne 0 ]] && echo "Must run as root or using sudo -H" && exit 1

sed -i 's/us.archive/au.archive/' /etc/apt/sources.list
echo "apt update disabled"

apt-get update -y

python/install-python.sh
ansible/install-ansible.sh

ansible-playbook -v -b -i localhost, ansible/add-repos.ansible
apt-get update -y
ansible-playbook -v -b -i localhost, ansible/server-setup.ansible -e 'ansible_python_interpreter=/usr/bin/python3'



