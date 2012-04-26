#!/bin/sh

pacman -Syy
pacman -Syu

pacman -S openssh git sudo
visudo

