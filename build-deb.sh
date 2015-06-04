#!/bin/bash

V=$(cat VERSION)

apt-get install build-essential autoconf checkinstall flex bison libncurses5-dev libreadline-dev git -y

# build ipv6
git clean -dxf
autoconf
./configure --enable-ipv6
make
checkinstall --pkgversion=`cat VERSION` --pkgname=bird6
mv bird6_$V-1_amd64.deb /tmp/

# build ipv4
git clean -dxf
autoconf
./configure
make
checkinstall --pkgversion=`cat VERSION` --pkgname=bird

mv /tmp/bird6_$V-1_amd64.deb .


