#!/bin/bash -e

if [ ! -d "$HOME/.ssh" ]; then
  ssh-keygen -t ed25519
fi
