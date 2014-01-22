#!/bin/sh
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# xorg
ln -s ${DIR}/home/.Xresources ~/.Xresources
ln -s ${DIR}/home/.Xmodmap ~/.Xmodmap
ln -s ${DIR}/home/.xinitrc ~/.xinitrc

# zsh
ln -s ${DIR}/home/.zsh ~/.zsh
ln -s ${DIR}/home/.zshrc ~/.zshrc
ln -s ${DIR}/home/.zshenv ~/.zshenv

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s ${DIR}/home/.oh-my-zsh/themes/beloglazov.zsh-theme ~/.oh-my-zsh/themes/beloglazov.zsh-theme

# xmonad
mkdir ~/.xmonad
ln -s ${DIR}/home/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# other
ln -s ${DIR}/home/.ctags ~/.ctags
ln -s ${DIR}/home/.gitconfig ~/.gitconfig
ln -s ${DIR}/home/.emacs.d ~/.emacs.d
ln -s ${DIR}/home/.vimrc ~/.vimrc
ln -s ${DIR}/home/.vim ~/.vim
ln -s ${DIR}/home/.nanorc ~/.nanorc
ln -s ${DIR}/home/.rtorrent.rc ~/.rtorrent.rc
ln -s ${DIR}/home/.xxkbrc ~/.xxkbrc

# backup directories
mkdir ~/.backups
mkdir ~/.backups/nano
mkdir ~/.backups/emacs

# bin
mkdir ~/bin
ln -s ${DIR}/home/bin/chromium ~/bin/chromium
ln -s ${DIR}/home/bin/disk-benchmark ~/bin/disk-benchmark
ln -s ${DIR}/home/bin/dmenu-edit ~/bin/dmenu-edit
ln -s ${DIR}/home/bin/dmenu-run ~/bin/dmenu-run
ln -s ${DIR}/home/bin/dmenu-urxvt ~/bin/dmenu-urxvt
ln -s ${DIR}/home/bin/e ~/bin/e
ln -s ${DIR}/home/bin/fix-keyboard ~/bin/fix-keyboard
ln -s ${DIR}/home/bin/libreoffice ~/bin/libreoffice
ln -s ${DIR}/home/bin/mem ~/bin/mem
ln -s ${DIR}/home/bin/pyflakespep8.py ~/bin/pyflakespep8.py
ln -s ${DIR}/home/bin/reboot ~/bin/reboot
ln -s ${DIR}/home/bin/screenshot ~/bin/screenshot
ln -s ${DIR}/home/bin/shutdown ~/bin/shutdown
ln -s ${DIR}/home/bin/silent ~/bin/silent
ln -s ${DIR}/home/bin/urxvtc ~/bin/urxvtc
ln -s ${DIR}/home/bin/zathura ~/bin/zathura

# .config
mkdir ~/.config
mkdir ~/.config/dmenu
ln -s ${DIR}/home/.config/dmenu/urxvt-list ~/.config/dmenu/urxvt-list
ln -s ${DIR}/home/.config/dmenu/edit-list ~/.config/dmenu/edit-list
ln -s ${DIR}/home/.config/zathura/zathurarc ~/.config/zathura/zathurarc


# root configs
sudo ln -s ${DIR}/home/.Xresources /root/.Xresources
sudo ln -s ${DIR}/home/.xinitrc /root/.xinitrc
sudo ln -s ${DIR}/home/.zsh /root/.zsh
sudo ln -s ${DIR}/home/.zshrc /root/.zshrc
sudo ln -s ${DIR}/home/.zshenv /root/.zshenv
sudo ln -s ${DIR}/home/.vimrc /root/.vimrc
sudo ln -s ${DIR}/home/.vim /root/.vim

sudo git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
sudo ln -s ${DIR}/home/.oh-my-zsh/themes/beloglazov.zsh-theme /root/.oh-my-zsh/themes/beloglazov.zsh-theme

sudo mkdir /root/.xmonad
sudo ln -s ${DIR}/home/.xmonad/xmonad.hs /root/.xmonad/xmonad.hs
sudo ln -s ${DIR}/home/.gitconfig /root/.gitconfig
sudo ln -s ${DIR}/home/.emacs.d /root/.emacs.d
sudo ln -s ${DIR}/home/.nanorc /root/.nanorc
sudo ln -s ${DIR}/home/.xxkbrc /root/.xxkbrc

sudo mkdir /root/.backups
sudo mkdir /root/.backups/nano
sudo mkdir /root/.backups/emacs

# bin
sudo mkdir /root/bin
sudo ln -s ${DIR}/home/bin/e-root /root/bin/e


# /etc

sudo ln -s ${DIR}/etc/X11/xorg.conf.d/50-keyboard.conf /etc/X11/xorg.conf.d/50-keyboard.conf
sudo ln -s ${DIR}/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf

sudo mv /etc/nanorc /etc/nanorc-backup
sudo ln -s ${DIR}/etc/nanorc /etc/nanorc
