#!/bin/sh

cd home/.emacs.d/modes/pylookup
wget http://docs.python.org/archives/python-2.7.3-docs-html.zip
unzip python-2.7.3-docs-html.zip
rm python-2.7.3-docs-html.zip
./pylookup.py -u python-2.7.3-docs-html
cd -
