#!/bin/bash

# Clone dotfiles repository.
git clone --recursive https://github.com/sfujiwara/dotfiles.git $HOME/dotfiles
cd $HOME/dotfiles

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages via Homebrew.
brew bundle install

# Install Google Cloud SDK.
if [ ! -d "$HOME/google-cloud-sdk" ]; then
  curl https://sdk.cloud.google.com | bash
fi

# Generate symbolic links.
./bin/ln.sh

# Use zsh as default shell.
chsh -s /bin/zsh

# Generate SSH key.
ssh-keygen -t rsa
