#!/bin/bash

# zsh.
ln -nfs ~/dotfiles/.zshrc ~/

# Emacs.
ln -nfs ~/dotfiles/.emacs.d ~/

# Git.
ln -nfs ~/dotfiles/.gitconfig ~/

# Settings for Mac.
if [ `uname` = "Darwin" ]; then
  # Karabiner.
  mkdir -p ~/.config/karabiner
  ln -nfs ~/dotfiles/karabiner.json ~/.config/karabiner/
  # Visual Studio Code.
  ln -nfs ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
fi

if [ `uname` = "Linux" ]; then
  # Visual Studio Code.
  ln -nfs $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
fi