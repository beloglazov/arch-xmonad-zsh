#!/bin/sh

sudo pacman -S xorg xorg-xinit xmonad xmonad-contrib consolekit rxvt-unicode dmenu numlockx xxkb chromium rsync jdk7-openjdk apache-ant maven lftp unzip tree subversion slock alsa-utils
yaourt urxvt-perls-git chromium-stable-libpdf flashplugin

ranger --copy-config=scope
sudo ranger --copy-config=scope
