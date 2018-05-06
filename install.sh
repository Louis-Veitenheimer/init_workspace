#!/bin/sh

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root"
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt-get install -y \
  curl \
  wget \
  vim \
  tmux \
  htop \
  jq \
  zsh \
  git

# install "oh my zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
