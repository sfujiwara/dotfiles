#!/bin/bash -eu

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew install tree
brew install curl
brew install wget
brew install git
brew install zsh
brew install pyenv
brew install pyenv-virtualenv

# brew install mecab
# brew install mecab-ipadic
# brew install apache-spark

brew tap caskroom/cask
brew cask install skim
brew cask install iterm2
brew cask install google-japanese-ime
brew cask install atom
brew cask install google-chrome
# brew cask install dropbox
brew cask install alfred
brew cask install libreoffice
