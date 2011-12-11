#!/bin/sh
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s ${DIR}/home/.Xresources ~/.Xresources
ln -s ${DIR}/home/.xinitrc ~/.xinitrc
ln -s ${DIR}/home/.zshrc ~/.zshrc
ln -s ${DIR}/home/.zshenv ~/.zshenv
ln -s ${DIR}/home/.oh-my-zsh/themes/beloglazov.zsh-theme ~/.oh-my-zsh/themes/beloglazov.zsh-theme

mkdir ~/.xmonad
ln -s ${DIR}/home/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -s ${DIR}/home/.gitconfig ~/.gitconfig

