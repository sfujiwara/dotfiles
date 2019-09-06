#!/bin/bash -u

ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.emacs.d ~/
ln -s ~/dotfiles/.gitconfig ~/

# TODO: Create directory if not exists
# TODO: Delete karabiner.json if exists
ln -s ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/
