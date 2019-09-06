#!/bin/bash -eu

# The line below is already not needed:
# https://rcmdnk.com/blog/2016/06/28/comptuer-mac-homebrew-brew-file/
# https://github.com/Homebrew/homebrew-cask/pull/13966
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap caskroom/versions

brew install tree
brew install curl
brew install wget
brew install git
brew install zsh
brew install pyenv
brew install nodebrew
brew install rbenv
brew install peco
# brew install open-mpi
# brew install mecab
# brew install mecab-ipadic
# brew install apache-spark

# brew tap caskroom/cask
brew cask install emacs
brew cask install skim
brew cask install iterm2
brew cask install google-japanese-ime
brew cask install atom
brew cask install google-chrome
brew cask install slack
brew cask install karabiner-elements
# brew cask install pycharm-ce
# brew cask install dropbox
brew cask install alfred
brew cask install libreoffice
brew cask install skitch
# brew cask install mactex

# For Kubernetes
# brew cask install virtualbox  # minikube requires virtualbox
brew cask install minikube 

brew cask install java
# brew cask install android-studio
brew install redpen
