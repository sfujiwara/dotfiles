#!/bin/bash

GO_VERSION=1.24.4

sudo rm -rf /usr/local/go

if [ ! -d "/usr/local/go" ]; then
    curl -OL "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
    rm go${GO_VERSION}.linux-amd64.tar.gz
fi
