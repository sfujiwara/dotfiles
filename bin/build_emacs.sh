#!/bin/bash

# Clone Emacs repository.
if [ ! -d "./emacs" ]; then
    git clone --recursive git://git.sv.gnu.org/emacs.git
fi
cd emacs

# Configure Emacs.
./autogen.sh
./configure \
    --with-native-compilation \
    --without-x \
    --with-mailutils \
    --with-imagemagick

# Build Emacs.
make
sudo make install
