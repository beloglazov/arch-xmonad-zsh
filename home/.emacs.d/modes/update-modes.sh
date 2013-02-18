#!/bin/sh

modes='ace-jump-mode auto-complete clojure-mode ebib erc-nick-notify ess fill-column-indicator flymake-cursor haskell-mode ido-ubiquitous magit markdown-mode paredit php-mode popup-el pylookup smex yasnippet'

for mode in $modes; do
    cd $mode
    git pull origin master
    cd ../
done
