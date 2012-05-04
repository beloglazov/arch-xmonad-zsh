#!/bin/sh

yaourt -S xorg-xfontsel terminus-font terminus-font-ttf ttf-dejavu otf-texgyre ttf-mac-fonts ttf-ms-fonts 
#ttf-win7-fonts

yaourt -S freetype2-infinality
yaourt -S fontconfig-infinality
yaourt -S lib32-freetype2-infinality

sudo /etc/fonts/infinality/infctl.sh setstyle win7
