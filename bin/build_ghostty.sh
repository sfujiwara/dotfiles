#!/bin/bash

VERSION=v1.1.3

git clone https://github.com/ghostty-org/ghostty
cd ghostty
git checkout $VERSION

zig build -p $HOME/.local  -Doptimize=ReleaseFast
