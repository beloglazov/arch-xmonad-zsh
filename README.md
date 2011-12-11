This is my configuration of Arch Linux + Xmonad + Zsh. At the moment, the repository includes the following configuration files:

 * .xinirc
 * .Xresources
 * Xmonad config
 * Zsh configs with a custom theme for .oh-my-zsh
 * .gitconfig
 * .emacs
 * .rtorrent.rc

Apart from that, simple install scripts are also included.

# Installation

First of all, you need to clone the repository of oh-my-zsh to your home directory:

 > git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

Then, you need to clone this repository to any directory you want:

> git clone git@github.com:beloglazov/arch-xmonad-zsh.git

Next, you need to cd into the cloned repository:

> cd arch-xmonad-zsh

And run the installation script, which will create symbolic links to .zshenv and .zshrc in your home directory:

> ./install.sh

If you want to install the same configuration for root, just run the following script and enter your sudo password:

> ./install-root.sh

Now you need to restart your shell to see the changes.


Enjoy!
