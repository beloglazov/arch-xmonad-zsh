#!/bin/sh
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# xorg
ln -s ${DIR}/home/.Xresources ~/.Xresources
ln -s ${DIR}/home/.xinitrc ~/.xinitrc

# zsh
ln -s ${DIR}/home/.zshrc ~/.zshrc
ln -s ${DIR}/home/.zshenv ~/.zshenv

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s ${DIR}/home/.oh-my-zsh/themes/beloglazov.zsh-theme ~/.oh-my-zsh/themes/beloglazov.zsh-theme

# xmonad
mkdir ~/.xmonad
ln -s ${DIR}/home/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# other
ln -s ${DIR}/home/.gitconfig ~/.gitconfig
ln -s ${DIR}/home/.emacs ~/.emacs
ln -s ${DIR}/home/.nanorc ~/.nanorc
ln -s ${DIR}/home/.rtorrent.rc ~/.rtorrent.rc

# bin
mkdir ~/bin
ln -s ${DIR}/home/bin/dmenu-run ~/bin/dmenu-run
ln -s ${DIR}/home/bin/dmenu-edit ~/bin/dmenu-edit
ln -s ${DIR}/home/bin/dmenu-urxvt ~/bin/dmenu-urxvt
ln -s ${DIR}/home/bin/urxvtc ~/bin/urxvtc
ln -s ${DIR}/home/bin/e ~/bin/e
ln -s ${DIR}/home/bin/disk-benchmark ~/bin/disk-benchmark

# .config
mkdir ~/.config
mkdir ~/.config/dmenu
ln -s ${DIR}/home/.config/dmenu/urxvt-list ~/.config/dmenu/urxvt-list
ln -s ${DIR}/home/.config/dmenu/edit-list ~/.config/dmenu/edit-list


# root configs
sudo ln -s ${DIR}/home/.Xresources /root/.Xresources
sudo ln -s ${DIR}/home/.xinitrc /root/.xinitrc
sudo ln -s ${DIR}/home/.zshrc /root/.zshrc
sudo ln -s ${DIR}/home/.zshenv /root/.zshenv
sudo ln -s ${DIR}/home/.oh-my-zsh /root/.oh-my-zsh

sudo mkdir /root/.xmonad
sudo ln -s ${DIR}/home/.xmonad/xmonad.hs /root/.xmonad/xmonad.hs
sudo ln -s ${DIR}/home/.gitconfig /root/.gitconfig
sudo ln -s ${DIR}/home/.emacs /root/.emacs
sudo ln -s ${DIR}/home/.nanorc /root/.nanorc


# /etc 

sudo ln -s ${DIR}/etc/X11/xorg.conf.d/50-keyboard.conf /etc/X11/xorg.conf.d/50-keyboard.conf
sudo ln -s ${DIR}/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

sudo mv /etc/nanorc /etc/nanorc-backup
sudo ln -s ${DIR}/etc/nanorc /etc/nanorc
#sudo ln -s ${DIR}/etc/rc.conf /etc/rc.conf
