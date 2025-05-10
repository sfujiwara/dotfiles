#!/bin/bash

sudo apt -y update
sudo apt -y upgrade

sudo apt -y install tree
sudo apt -y install curl
sudo apt -y install direnv
sudo apt -y install fcitx5-mozc
sudo apt -y install zsh
sudo apt -y install gnome-tweaks
sudo apt -y install build-essential
sudo apt -y install libbz2-dev libdb-dev libreadline-dev libffi-dev libgdbm-dev liblzma-dev libncursesw5-dev libsqlite3-dev libssl-dev zlib1g-dev uuid-dev tk-dev python3-dev
sudo apt -y install libfuse2  # Required to run JetBrains Toolbox.

# Install Google Chrome.
# curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install google-chrome-stable
