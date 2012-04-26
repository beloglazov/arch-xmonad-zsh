This is my configuration of Arch Linux + Xmonad + Zsh. The repository includes the following configuration files:

 * .xinirc
 * .Xresources
 * Xmonad config
 * Zsh configs
 * oh-my-zsh with a custom theme
 * .gitconfig
 * .emacs
 * .nanorc
 * .rtorrent.rc
 * and others

Apart from that, simple install scripts are also included.

# Installation

First of all, you need to clone this repository to any directory you want:

> git clone https://github.com/beloglazov/arch-xmonad-zsh.git

Next, you need to cd into the cloned repository:

> cd arch-xmonad-zsh

The repository contains a number of installation scripts. They can be used to configure a clean installation of Arch Linux. To apply the configuration, you need to run the scripts one by one according to their numbers. The first script must be run as root to setup the sudo command. The other scripts can be run by a regular user that is sudo-enabled. Once, all the installation scripts have been run, it's best to reboot the system to see the changes. To run Xmonad, just login as a regular user and run:

> startx

Enjoy!
