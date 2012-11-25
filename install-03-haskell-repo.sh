#!/bin/sh

sudo sed -i 's/\[extra\]/\[haskell\]\nServer = http:\/\/xsounds.org\/~haskell\/$arch\n\n\[extra\]/g' /etc/pacman.conf
yaourt -Syu
