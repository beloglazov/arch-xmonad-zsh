#!/bin/sh

yaourt -S openssh chromium rsync jdk7-openjdk apache-ant maven lftp unzip tree \
	subversion alsa-utils flashplugin autojump ntp ranger chromium-stable-libpdf \
	ack glances alsi aspell aspell-en ispell bc colordiff colorsvn cope-git dictd \
	diction dmidecode elinks htop iftop lesspipe highlight mpd ncdu ncmpcpp feh \
	hwinfo pydf atool libcaca rtorrent extract dzen2 emacs w3m emacs-w3m-cvs mplayer \
	ntfs-3g cloc zathura zathura-pdf-poppler acroread dtrx

mkdir -p ~/.config/ranger
ranger --copy-config=scope

sudo mkdir -p /root/.config/ranger
sudo ranger --copy-config=scope
