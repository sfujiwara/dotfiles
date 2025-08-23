#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install -y docker-ce
sudo apt install -y docker-ce-cli
sudo apt install -y containerd.io
sudo apt install -y docker-buildx-plugin
sudo apt install -y docker-compose-plugin

# Create docker group
sudo groupadd docker
sudo usermod -aG docker $USER
