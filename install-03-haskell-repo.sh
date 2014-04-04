#!/bin/sh

sudo sed -i 's/\[extra\]/\[haskell\]\nServer = http:\/\/xsounds.org\/~haskell\/core\/$arch\n\n\[extra\]/g' /etc/pacman.conf
yaourt -Syu
sudo pacman-key --lsign-key 4209170B
yaourt -Syu
