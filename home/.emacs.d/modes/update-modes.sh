#!/bin/sh

modes='ace-jump-mode auto-complete clojure-mode ebib erc-nick-notify ess evil fill-column-indicator flymake-cursor haskell-mode ido-ubiquitous jump-mode magit markdown-mode multiple-cursors paredit php-mode popup-el pylookup smex yasnippet'

for mode in $modes; do
    cd $mode
    git pull origin master
    cd ../
done
