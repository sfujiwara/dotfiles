#!/bin/bash -e

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

# Install pakages with apt.
./bin/ubuntu/apt.sh

# Install others.
./bin/ubuntu/install_go.sh
./bin/ubuntu/install_gcloud.sh
./bin/ubuntu/install_asdf.sh
./bin/ubuntu/install_docker.sh

# Generate symbolic links.
./bin/ln.sh

# Use zsh as default shell.
chsh -s /bin/zsh

# Generate SSH key.
if [ ! -d "$HOME/.ssh" ]; then
  ssh-keygen -t ed25519
fi
