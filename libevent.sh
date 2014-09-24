#!/bin/bash
# Script to install libevent.

set -e
NCPU=4

VERSION=2.0.21
WORKDIR=libevent-$VERSION-stable
TARBALL=$WORKDIR.tar.gz
if [ ! -f $TARBALL ]; then
   wget https://github.com/downloads/libevent/libevent/$TARBALL
fi
if [ ! -d $WORKDIR ]; then
   tar -xf $TARBALL
fi

cd $WORKDIR
./configure --prefix=$HOME
make -j $NCPU
make install
