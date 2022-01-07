#!/bin/bash

sudo apt update
sudo apt install -y \
    zsh \
	git \
	vim \
	htop \
	wget \
	unzip \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

if [ `uname -m` = "armv7l" ]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=armhf signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi
sudo apt update
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io


sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


mkdir -p $HOME/bin
if [ `uname -m` = "armv7l" ]; then
	wget https://github.com/rhysd/dotfiles/releases/download/v0.2.2/dotfiles_linux_arm.zip
else
	wget https://github.com/rhysd/dotfiles/releases/download/v0.2.2/dotfiles_linux_amd64.zip
fi
unzip dotfiles_*.zip
mv dotfiles $HOME/bin
rm -rf dotfiles_*.zip

$HOME/bin/dotfiles link

