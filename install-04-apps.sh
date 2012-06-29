#!/bin/sh

yaourt -S xorg xorg-xinit xmonad xmonad-contrib consolekit rxvt-unicode dmenu numlockx xxkb chromium rsync jdk7-openjdk apache-ant maven lftp unzip tree subversion slock alsa-utils urxvt-perls-git flashplugin autojump openntpd ranger chromium-stable-libpdf

mkdir -p ~/.config/ranger
ranger --copy-config=scope

sudo mkdir -p /root/.config/ranger
sudo ranger --copy-config=scope
