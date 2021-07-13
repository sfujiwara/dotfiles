#!/bin/bash

# TODO: Create a directory if not exists

# TODO:
# Ask when overwrite existing files or symbolic links.
# Currently, overwrite them without asking.

ln -nfs ~/dotfiles/.zshrc ~/
ln -nfs ~/dotfiles/.emacs.d ~/
ln -nfs ~/dotfiles/.gitconfig ~/

# Settings for VSCode on Mac
if [ `uname` = "Darwin" ]; then
  ln -nfs ~/dotfiles/lns/vscode/settings.json ~/Library/Application\ Support/Code/User/
fi

# Karabiner setting for Mac
if [ `uname` = "Darwin" ]; then
  mkdir -p ~/.config/karabiner
  ln -nfs ~/dotfiles/lns/.config/karabiner/karabiner.json ~/.config/karabiner/
fi
