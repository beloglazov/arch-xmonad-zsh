#!/bin/sh

sudo pacman -S zsh
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
