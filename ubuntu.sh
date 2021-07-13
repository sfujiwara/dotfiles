#!/bin/bash

# Change default directory names from JP to EN.
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# Install git.
sudo apt update
sudo apt install -y git

# Clone dotfiles repository.
git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# Install packages via apt.
./bin/apt.sh

# Install pyenv.
if [ ! -d "$HOME/.pyenv" ]; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

# Install Google Cloud SDK.
if [ ! -d "$HOME/google-cloud-sdk" ]; then
  curl https://sdk.cloud.google.com | bash
fi

# Generate symbolic links.
./bin/ln.sh
