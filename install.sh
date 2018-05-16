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
cp .zshrc ~/.zshrc

# install "oh my zsh"
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || {
  printf "Error: git clone of oh-my-zsh repo failed\n"
  exit 1
}

# change current shell to zsh
chsh -s $(grep /zsh$ /etc/shells | tail -1)

# remove git integration with zsh theme (makes things hella slow when git
# repo originates on a windows share)
sed -i '/$(git_prompt_info)/d' ~/.oh-my-zsh/themes/af-magic.zsh-theme
