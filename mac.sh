#!/bin/bash

# Clone dotfiles repository.
git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)

# Install packages via Homebrew.
brew bundle install

# Generate symbolic links.
./bin/ln.sh
