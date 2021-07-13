# Common commands for Mac and Ubuntu

.PHONY: symbolic-links
symbolic-links:
	./bin/ln.sh

.PHONY: install-gcloud-sdk
install-gcloud-sdk:
	curl https://sdk.cloud.google.com | bash

.PHONY: use-zsh
use-zsh:
	chsh -s /bin/zsh

.PHONY: ssh-keygen
ssh-keygen:
	ssh-keygen -t rsa
