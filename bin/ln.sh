#!/bin/bash

# zsh
ln -nfs $HOME/dotfiles/.zshrc $HOME/

# bash
ln -nfs $HOME/dotfiles/.bashrc $HOME/

# Emacs
ln -nfs $HOME/dotfiles/.emacs.d $HOME/

# Git
ln -nfs $HOME/dotfiles/.gitconfig $HOME/
mkdir -p $HOME/.config/git
ln -nfs $HOME/dotfiles/.config/git/ignore $HOME/.config/git/

# LaTeX
ln -nfs $HOME/dotfiles/.latexmkrc $HOME/.latexmkrc

# tmux
ln -nfs $HOME/dotfiles/.tmux.conf $HOME/

# Settings for Mac
if [ `uname` = "Darwin" ]; then
  # Karabiner
  mkdir -p $HOME/.config
  ln -nfs $HOME/dotfiles/.config/karabiner $HOME/.config/
  # Visual Studio Code
  ln -nfs $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
  ln -nfs $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
fi

if [ `uname` = "Linux" ]; then
  # Visual Studio Code
  mkdir -p $HOME/.config/Code/User
  ln -nfs $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
  ln -nfs $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
fi
