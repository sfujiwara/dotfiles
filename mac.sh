#!/bin/bash

# Clone dotfiles repository.
git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# Install Homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install packages via Homebrew.
brew bundle install
