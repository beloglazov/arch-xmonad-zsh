#!/bin/sh

pacman -Syy
pacman -Syu

pacman -S openssh git sudo

echo "To enable sudo for the wheel group, uncomment the following line in /etc/sudoers:"
echo "%wheel ALL=(ALL) ALL"
echo "To enable shortcuts for reboot and shutdown, add the following line into /etc/sudoers:"
echo "%wheel ALL=(ALL) NOPASSWD: /sbin/shutdown,/sbin/reboot"
read -p "OK? (press Enter and you will be redirected to visudo)"

visudo

echo "Now you need to add the non-root user into the wheel group to enable sudo"

