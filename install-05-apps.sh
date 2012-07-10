#!/bin/sh

yaourt -S xorg xorg-xinit haskell-xmonad haskell-xmonad-contrib haskell-xmonad-extras consolekit rxvt-unicode dmenu numlockx xxkb chromium rsync jdk7-openjdk apache-ant maven lftp unzip tree subversion slock alsa-utils urxvt-perls-git flashplugin autojump openntpd ranger chromium-stable-libpdf

mkdir -p ~/.config/ranger
ranger --copy-config=scope

sudo mkdir -p /root/.config/ranger
sudo ranger --copy-config=scope
