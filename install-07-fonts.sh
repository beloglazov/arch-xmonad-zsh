#!/bin/sh

yaourt -S --noconfirm xorg-xfontsel terminus-font terminus-font-ttf ttf-dejavu otf-texgyre ttf-mac-fonts ttf-ms-fonts freetype2-infinality fontconfig-infinality

# lib32-freetype2-infinality

sudo /etc/fonts/infinality/infctl.sh setstyle win7
