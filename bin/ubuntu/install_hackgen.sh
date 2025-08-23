#!/bin/bash -e

VERSION=v2.10.0
HACKGEN=HackGen_$VERSION
HACKGEN_NF=HackGen_NF_$VERSION

mkdir -p ${HOME}/.local/share/fonts

# Install HackGen
wget https://github.com/yuru7/HackGen/releases/download/${VERSION}/${HACKGEN}.zip
unzip  -d ./ ./$HACKGEN
cp ./${HACKGEN}/*.ttf ${HOME}/.local/share/fonts/
rm ${HACKGEN}.zip
rm -r ${HACKGEN}

# Install HackGen NF
wget https://github.com/yuru7/HackGen/releases/download/${VERSION}/${HACKGEN_NF}.zip
unzip  -d ./ ./$HACKGEN_NF
cp ./${HACKGEN_NF}/*.ttf ${HOME}/.local/share/fonts/
rm ${HACKGEN_NF}.zip
rm -r ${HACKGEN_NF}
