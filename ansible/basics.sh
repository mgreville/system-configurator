#!/usr/bin/env bash

sudo apt update
sudo apt upgrade
sudo apt -y install tree screen jq htop atop vim inxi net-tools xterm

# For Python psql bindings
sudo apt install python3-dev libpq-dev

# Install mainline
sudo add-apt-repository ppa:cappelikan/ppa
sudo apt update
sudo apt install -y mainline

# Install git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install -y git

# Install build-essentials
# Required for python builds and other needs
sudo apt-get install build-essential
sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo set scrolloff=2 | tee -a ~/.vimrc > /dev/null
echo set scrolloff=2 | sudo tee -a ~/.vimrc > /dev/null
sudo chgrp adm /usr/local/bin
sudo chmod g+w /usr/local/bin

sudo apt install -y samba

sudo apt install -y virt-manager
sudo usermod --append --groups libvirt mgreville

#create samba configuration
sudo smbpasswd -a mgreville

#set hostname
hostnamectl --static set-hostname maximus

#install docker
sudo apt-get install -y docker.io
sudo gpasswd -a mgreville docker
newgrp docker

#install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#install gcloud
#install kubetctl
#install kubens
#install kubectx
#install k9s
#install tfswitcher
#install helm-switcher


#install skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/

#install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm -v
nvm ls -remote
nvm install v10.18.0

#install ruby
#install vagrant
wget https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb
#install vagrant-libvirt dependencies and plugin
sudo apt install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base
vagrant plugin install vagrant-libvirt

#install packer
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer


sudo apt-get install fortune
