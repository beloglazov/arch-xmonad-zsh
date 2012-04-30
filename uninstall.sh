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
rm ~/.emacs
rm ~/.nanorc
rm ~/.rtorrent.rc
rm ~/.xxkbrc
rm -rf ~/.backups

# bin
rm ~/bin/dmenu-run
rm ~/bin/dmenu-edit
rm ~/bin/dmenu-urxvt
rm ~/bin/urxvtc
rm ~/bin/e
rm ~/bin/disk-benchmark
rm ~/bin/pyflakespep8.py

# .config
rm ~/.config/dmenu/urxvt-list
rm ~/.config/dmenu/edit-list


# root configs
sudo rm /root/.Xresources
sudo rm /root/.xinitrc
sudo rm /root/.zshrc
sudo rm /root/.zshenv
sudo rm /root/.oh-my-zsh

sudo rm /root/.xmonad/xmonad.hs
sudo rm /root/.gitconfig
sudo rm /root/.emacs.d
sudo rm /root/.emacs
sudo rm /root/.nanorc
sudo rm /root/.xxkbrc
sudo rm -rf /root/.backups


# /etc 

sudo rm /etc/X11/xorg.conf.d/50-keyboard.conf
sudo rm /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
