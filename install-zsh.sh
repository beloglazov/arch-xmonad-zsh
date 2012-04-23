#!/bin/sh

sudo pacman -Syy
sudo pacman -S zsh
chsh -s $(which zsh)
