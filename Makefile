# Common commands for Mac and Ubuntu

.PHONY: symbolic-links
symbolic-links:
	./bin/ln.sh

.PHONY: install-gcloud-sdk
install-gcloud-sdk:
	curl https://sdk.cloud.google.com | bash

.PHONY: install-python2-for-gcloud
install-python2-for-gcloud:
	pyenv install 2.7.9

.PHONY: use-zsh
use-zsh:
	chsh -s /bin/zsh

.PHONY: ssh-keygen
ssh-keygen:
	ssh-keygen -t rsa

# Commands only for Mac

.PHONY: install-homebrew
install-homebrew:
	./bin/install_homebrew.sh

.PHONY: brew-bundle
brew-bundle:
	brew bundle install

.PHONY: init-mac
init-mac:
	echo to be implemented
