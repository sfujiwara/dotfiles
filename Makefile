# Common commands for Mac and Ubuntu

.PHONY: symbolic-links
symbolic-links:
	bash bin/ln.sh

.PHONY: install-gcloud-sdk
install-gcloud-sdk:
	curl https://sdk.cloud.google.com | bash


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
