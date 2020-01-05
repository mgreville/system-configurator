#/bin/bash

apt install -y samba
apt install -y virt-manager

usermod --append --groups libvirt mgreville

#create samba configuration
smbpasswd -a mgreville

#set hostname
hostnamectl --static set-hostname maximus

