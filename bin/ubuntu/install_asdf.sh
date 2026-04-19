#!/bin/bash -e

VERSION=0.18.1
TEMPDIR=$(mktemp -d)

wget https://github.com/asdf-vm/asdf/releases/download/v${VERSION}/asdf-v${VERSION}-linux-amd64.tar.gz -P ${TEMPDIR} -q
tar -zxf ${TEMPDIR}/asdf-v${VERSION}-linux-amd64.tar.gz -C ${TEMPDIR}
sudo cp ${TEMPDIR}/asdf /usr/local/bin/asdf
