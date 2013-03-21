#!/bin/sh

# xorg
rm ~/.Xresources
rm ~/.xinitrc

# zsh
rm ~/.zshrc
rm ~/.zshenv

# oh-my-zsh
rm -rf ~/.oh-my-zsh

# xmonad
rm ~/.xmonad/xmonad.hs

# other
rm ~/.gitconfig
rm ~/.emacs.d
rm ~/.nanorc
rm ~/.rtorrent.rc
rm ~/.xxkbrc

# bin
rm ~/bin/chromium
rm ~/bin/dmenu-run
rm ~/bin/dmenu-edit
rm ~/bin/dmenu-urxvt
rm ~/bin/urxvtc
rm ~/bin/e
rm ~/bin/disk-benchmark
rm ~/bin/pyflakespep8.py
rm ~/bin/fix-keyboard
rm ~/bin/reboot
rm ~/bin/screenshot
rm ~/bin/shutdown
rm ~/bin/silent

# .config
rm ~/.config/dmenu/urxvt-list
rm ~/.config/dmenu/edit-list


# root configs
sudo rm /root/.Xresources
sudo rm /root/.xinitrc
sudo rm /root/.zshrc
sudo rm /root/.zshenv
sudo rm -rf /root/.oh-my-zsh

sudo rm /root/.xmonad/xmonad.hs
sudo rm /root/.gitconfig
sudo rm /root/.emacs.d
sudo rm /root/.nanorc
sudo rm /root/.xxkbrc


# /etc

sudo rm /etc/X11/xorg.conf.d/50-keyboard.conf
sudo rm /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

sudo rm /etc/nanorc
sudo mv /etc/nanorc-backup /etc/nanorc
