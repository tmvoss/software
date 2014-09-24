#!/bin/bash

set -e
NCPU=4
PACKAGE=ncurses
VERSION=5.9
WORKDIR=$PACKAGE-$VERSION
TARBALL=$WORKDIR.tar.gz
if [ ! -f $TARBALL ]; then
   wget http://ftp.gnu.org/pub/gnu/ncurses/$TARBALL
fi
if [ ! -d $WORKDIR ]; then
   tar -xf $TARBALL
fi

cd $WORKDIR
./configure --prefix=$HOME
make -j $NCPU
make install
