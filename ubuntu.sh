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

# Install Go v1.22.3.
if [ ! -d "/usr/local/go" ]; then
  curl -OL "https://go.dev/dl/go1.22.3.linux-amd64.tar.gz"
  sudo tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
  rm go1.22.3.linux-amd64.tar.gz
fi

# Install pyenv.
if [ ! -d "$HOME/.pyenv" ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

# Install asdf.
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
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