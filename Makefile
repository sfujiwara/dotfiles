# Common commands for Mac and Ubuntu

.PHONY: symbolic-links
symbolic-links:
	bash bin/ln.sh

.PHONY: install-gcloud-sdk
install-gcloud-sdk:
	curl https://sdk.cloud.google.com | bash

.PHONY: install-python2-for-gcloud
install-python2-for-gcloud:
	pyenv install 2.7.9

.PHONY: set-default-shell
set-default-shell:
	chsh -s /bin/zsh

.PHONY: ssh-keygen
ssh-keygen:
	ssh-keygen -t rsa

# Commands only for Mac

.PHONY: install-homebrew
install-homebrew:
	bash bin/install_homebrew.sh

.PHONY: brew-bundle
brew-bundle:
	brew bundle install

.PHONY: all-for-mac
all-for-mac:
	echo to be implemented
