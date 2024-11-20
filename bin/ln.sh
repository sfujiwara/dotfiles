#!/bin/bash

# zsh.
ln -nfs ~/dotfiles/.zshrc ~/

# bash.
ln -nfs ~/dotfiles/.bashrc $HOME/

# Emacs.
ln -nfs ~/dotfiles/.emacs.d ~/

# Git.
ln -nfs ~/dotfiles/.gitconfig ~/
mkdir -p ~/.config/git
ln -nfs ~/dotfiles/.config/git/ignore ~/.config/git/

# Settings for Mac.
if [ `uname` = "Darwin" ]; then
  # Karabiner.
  mkdir -p ~/.config/karabiner
  ln -nfs ~/dotfiles/karabiner.json ~/.config/karabiner/
  # Visual Studio Code.
  # ln -nfs ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
fi

if [ `uname` = "Linux" ]; then
  # Visual Studio Code.
  ln -nfs $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
fi
