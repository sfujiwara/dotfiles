#!/bin/bash

# Clone dotfiles repository.
git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages via Homebrew.
brew bundle install

# Generate symbolic links.
./bin/ln.sh

# Use zsh as default shell.
chsh -s /bin/zsh

# Generate SSH key.
ssh-keygen -t rsa
