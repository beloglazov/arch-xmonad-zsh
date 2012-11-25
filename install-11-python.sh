#!/bin/sh

yaourt -S python2-pip python2-ropemacs python2-pyflakes ipython2 ipython2-docs
sudo pip2 install pep8

cd home/.emacs.d/modes/pylookup
wget http://docs.python.org/archives/python-2.7.3-docs-html.zip
unzip python-2.7.3-docs-html.zip
rm python-2.7.3-docs-html.zip
./pylookup.py -u python-2.7.3-docs-html
cd -
