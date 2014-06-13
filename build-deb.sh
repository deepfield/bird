#!/bin/bash

apt-get install build-essential autoconf checkinstall flex bison libncurses5-dev libreadline-dev git -y

autoconf
./configure --enable-ipv6
make
checkinstall --pkgversion=`cat VERSION` --pkgname=bird6

git clean -dxf

autoconf
./configure
make
checkinstall --pkgversion=`cat VERSION` --pkgname=bird
