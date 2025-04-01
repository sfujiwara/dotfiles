#!/bin/bash

# Install Go v1.22.3.

if [ ! -d "/usr/local/go" ]; then
    curl -OL "https://go.dev/dl/go1.22.3.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
    rm go1.22.3.linux-amd64.tar.gz
fi
