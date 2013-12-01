#!/bin/sh

yaourt -S python2-pip python2-ropemacs python2-pyflakes ipython2 bpython2
sudo pip2 install pep8
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python2 /usr/bin/python
sudo ln -s /usr/bin/pip2 /usr/bin/pip
