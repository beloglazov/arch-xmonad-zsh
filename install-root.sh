#!/bin/sh
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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
