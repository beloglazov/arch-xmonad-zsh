This repository contains my configuration of Arch Linux with Xmonad, Zsh, Vim,
and other tools. In addition to the configuration files themselves, the
repository includes scripts for installing software, which I use in my
day-to-day work, and for symlinking the configuration files to the right
locations. The scripts can be used to completely configure a clean installation
of Arch Linux. In summary, the following software and tools are installed and
configured:

 - Xmonad: a tiling window manager
 - Zsh + oh-my-zsh: a Shell
 - Yaourt: a package installer, which handles both the core repositories and AUR
 - Vim: a text editor, which I mainly use these days
 - Emacs: a text editor, which I used for 1.5 years before switching to Vim
 - Git: a version control system
 - Freetype2 infinality + a set of fonts (e.g., Terminus): font configuration
 - Tex, Python libs, and may other useful applications


# Initial steps

The scripts included in this repo assume that you have Arch Linux installed,
which can be done by following the installation procedure described in the Arch
wiki:

 - https://wiki.archlinux.org/index.php/Installation_Guide
 - https://wiki.archlinux.org/index.php/Beginners_Guide

Once you have Arch Linux installed, you need to follow the following basic steps
as `root` to be able to use the scripts from this repo:

1. By default, the dhcp daemon is disabled, you need to turn it on:
```Bash
systemctl enable dhcpcd
systemctl start dhcpcd
```

2. Next, it's a good idea to rank the repo mirrors to use the fastest available:
```Bash
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist-backup > /etc/pacman.d/mirrorlist
```

3. Update the system, and install `sudo`, `openssh`, and `git`:
```Bash
pacman -Syu
pacman -S sudo openssh git
```

4. Modify the sudo configuration to allow users from the `wheel` group to use
   `sudo`:
```Bash
visudo
# Uncomment the following line, and save the file with :wq
# %wheel ALL=(ALL) ALL
```

5. Create a user `<username>`, add the user to `wheel`, and set the password:
```Bash
useradd -m <username>
usermod -G wheel -a <username>
passwd <username>
```

6. Added a Haskell repository as described here (it will be used to install
   Xmonad): https://wiki.archlinux.org/index.php/Haskell_Package_Guidelines

Now, you are ready to clone the current repository and start running the
configuration scripts. This needs to be done under `<username>`. The following
commands switch to the `<username>` user, create a `repos` directory, and clone
this repository there:

```Bash
su - <username>
mkdir repos
cd repos
git clone git://github.com/beloglazov/arch-xmonad-zsh.git
cd arch-xmonad-zsh
```

# Installation scripts

Everything is now ready to start running the installation scripts in the order
of their numbers:

1. `./install-00-init-submodules.sh`: initialize Git submodules, which include
   Emacs modes and Vim plugins.
2. `./install-01-yaourt.sh`: install Yaourt.
3. `./install-02-zsh.sh`: install Zsh and make it the default Shell.
4. `./install-04-xmonad.sh`: install Xmonad, its dependencies, and the following
   related useful apps:
    - `rxvt-unicode`: a highly customizable terminal
    - `dmenu`: a great customizable tool for running applications and other
      tasks
    - `xxkb`: remember window-specific keyboard layouts
    - `slock`: an awesome screen locker
5. `./install-05-apps.sh`: install a number of useful and essential applications:
    - `gvim`: *the* text editor, comes with extra functionality compared with
      the default Vim
    - `emacs`: the text editor editor :)
    - `chromium`: an open source version of Google Chrome
    - `ranger`: an amazing file manager
    - `ack`: a tool for searching in files
    - `fasd`: an indispensable directory and file jumping program
    - `htop`: system and resource utilization information at a glance
    - `colordiff`: add some colors to your diffs
    - `feh`: a very fast image viewer
    - `ncdu`: a tool for finding things that consume disk space and deleting them
    - `mpd` + `ncmpcpp`: a great audio player and curses front-end to it
    - `pydf`: disk usage in color
    - `dzen2`: a tool for displaying information in an overlay
    - `zathura`: an awesome PDF viewer with Vim-like key bindings
    - `dtrx`: an intelligent archive extractor
    - and other useful tools
6. `./install-06-configs.sh`: create symlinks to all the configs, clone
   `.oh-my-zsh` for both `<username>` and `root`.
7. `./install-07-fonts.sh`: install freetype2-infinality and a set of fonts:
    - Terminus
    - DejaVu
    - TeX Gyre
    - Mac fonts
    - MS fonts
8. `./install-08-libreoffice.sh`: you need an office in this life, let it be
   LibreOffice.
9. `./install-09-tex.sh`: Latex tools: texlive, auctex, texmaker.
10. `./install-10-python.sh`: Python tools and libs:
    - `pip2`: a Python package manager
    - `ipython2`: a powerful Python Shell
    - `bpython2`: another Python Shell with fancy auto-completion
    - and other tools: ropemacs, pyflakes, pep8
11. `./install-11-pandoc.sh`: a great Haskell library and tool for converting
    various text file format.

Once the steps are completed, reboot, login, type `startx`, and enjoy! :)


# Key-bindings and aliases

This section is still to be written :) Meanwhile, have a look at
`~/.xmonad/xmonad.hs`, `~/.zshrc`, `~/.gitconfig`, and `~/.vimrc`.


## License

The source code is released under the Apache 2.0 license.

Copyright (C) 2013 Anton Beloglazov
