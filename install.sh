#!/bin/sh

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
  curl \
  wget \
  vim \
  tmux \
  htop \
  jq \
  zsh \
  git

cp .vimrc ~/.vimrc

# install "oh my zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# gets overwritten if added before oh-my-zsh is installed
cp .zshrc ~/.zshrc

# remove git integration with zsh theme (makes things hella slow when git
# repo originates on a windows share)
patch ~/.oh-my-zsh/themes/af-magic.zsh-theme af-magic.zsh-theme.patch
