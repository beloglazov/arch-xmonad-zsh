#!/bin/sh

yaourt -S cabal-install
cabal update
cabal install pandoc
