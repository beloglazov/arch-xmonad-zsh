This is my configuration of Arch Linux + Xmonad + Zsh. At the moment, the repository includes the following configuration files:

 * .xinirc
 * .Xresources
 * Xmonad config
 * Zsh configs
 * oh-my-zsh with a custom theme
 * .gitconfig
 * .emacs
 * .nanorc
 * .rtorrent.rc

Apart from that, simple install scripts are also included.

# Installation

First of all, you need to clone this repository to any directory you want:

> git clone git@github.com:beloglazov/arch-xmonad-zsh.git

Next, you need to cd into the cloned repository:

> cd arch-xmonad-zsh

And run the installation script, which will create symbolic links to the configuration files for the current user and for root (it will ask the sudo password for linking configuration files in /root):

> ./install.sh

Now you need to restart X11 to see the changes.


Enjoy!
