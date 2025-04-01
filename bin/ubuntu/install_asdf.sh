#!/bin/bash

VERSION=0.16.2
TEMPDIR=$(mktemp -d)

wget https://github.com/asdf-vm/asdf/releases/download/v${VERSION}/asdf-v${VERSION}-linux-amd64.tar.gz -P ${TEMPDIR} -q
tar -zxvf ${TEMPDIR}/asdf-v${VERSION}-linux-amd64.tar.gz -C ${TEMPDIR}
sudo cp ${TEMPDIR}/asdf /usr/local/bin/asdf
