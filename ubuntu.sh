#!/bin/bash

# Change default directory names from JP to EN.
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Install git.
sudo apt update
sudo apt install -y git

# Clone dotfiles repository.
if [ ! -d "$HOME/dotfiles" ]; then
  git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
fi
cd $HOME/dotfiles

# Install packages via apt.
./bin/apt.sh

# Install pyenv.
if [ ! -d "$HOME/.pyenv" ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

# Install nodenv.
if [ ! -d "$HOME/.nodenv" ]; then
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  mkdir -p "$(~/.nodenv/bin/nodenv root)"/plugins
  git clone https://github.com/nodenv/node-build.git "$(~/.nodenv/bin/nodenv root)"/plugins/node-build
fi

# Install tfenv.
if [ ! -d "$HOME/.tfenv" ]; then
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
fi

# Install Google Cloud SDK.
if [ ! -d "$HOME/google-cloud-sdk" ]; then
  curl https://sdk.cloud.google.com | bash
fi

# Generate symbolic links.
./bin/ln.sh

# Use zsh as default shell.
chsh -s /bin/zsh

# Generate SSH key.
if [ ! -d "$HOME/.ssh" ]; then
  ssh-keygen -t rsa
fi