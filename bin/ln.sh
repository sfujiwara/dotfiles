#!/bin/bash

# zsh
ln -nfs ~/dotfiles/.zshrc ~/

# bash
ln -nfs ~/dotfiles/.bashrc $HOME/

# Emacs
ln -nfs ~/dotfiles/.emacs.d ~/

# Git
ln -nfs ~/dotfiles/.gitconfig ~/
mkdir -p ~/.config/git
ln -nfs ~/dotfiles/.config/git/ignore ~/.config/git/

# LaTeX
ln -nfs ${HOME}/dotfiles/.latexmkrc ${HOME}/.latexmkrc

# tmux
ln -nfs ~/dotfiles/.tmux.conf ~/

# Settings for Mac
if [ `uname` = "Darwin" ]; then
  # Karabiner
  mkdir -p ~/.config
  ln -nfs ~/dotfiles/.config/karabiner ~/.config/
  # Visual Studio Code
  ln -nfs ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  ln -nfs ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi

if [ `uname` = "Linux" ]; then
  # Visual Studio Code
  ln -nfs $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
  ln -nfs $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
fi
