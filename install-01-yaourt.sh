#!/bin/sh

# install dependencies
sudo pacman -S curl wget yajl base-devel
mkdir /tmp/aur
cd /tmp/aur

# install package-query
wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar -xzf package-query.tar.gz
cd package-query
makepkg
sudo pacman -U *.xz
cd ../
rm -rf package-query

# install yaourt
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xzf yaourt.tar.gz
cd yaourt
makepkg
sudo pacman -U *.xz
cd ../
rm -rf yaourt

yaourt -S pacman-color
