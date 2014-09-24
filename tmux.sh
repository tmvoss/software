#!/bin/bash

set -e
NCPU=4
PACKAGE=tmux
VERSION=1.9a
WORKDIR=$PACKAGE-$VERSION
TARBALL=$WORKDIR.tar.gz
if [ ! -f $TARBALL ]; then
   wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9a.tar.gz?r=http%3A%2F%2Ftmux.sourceforge.net%2F&ts=1411349575&use_mirror=superb-dca3
fi
if [ ! -d $WORKDIR ]; then
   tar -xf $TARBALL
fi

cd $WORKDIR
./configure --prefix=$HOME CFLAGS="-I$HOME/include -I$HOME/include/ncurses" LDFLAGS="-L$HOME/lib"
make -j $NCPU
make install
