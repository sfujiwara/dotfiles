#!/bin/sh

# TODO: Create a directory if not exists

# TODO:
# Ask when overwrite existing files or symbolic links.
# Currently, overwrite them without asking.

ln -nfs ~/dotfiles/.zshrc ~/
ln -nfs ~/dotfiles/.emacs.d ~/
ln -nfs ~/dotfiles/.gitconfig ~/

# Karabiner setting for Mac
if [ `uname` = "Darwin" ]; then
  mkdir -p ~/.config/karabiner
  ln -nfs ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/
fi
