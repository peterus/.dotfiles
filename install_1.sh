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
