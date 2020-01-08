#!/usr/bin/env bash

apt install -y samba
apt install -y virt-manager

usermod --append --groups libvirt mgreville

#create samba configuration
smbpasswd -a mgreville

#set hostname
hostnamectl --static set-hostname maximus

#install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm -v
nvm ls -remote
nvm install v10.18.0

