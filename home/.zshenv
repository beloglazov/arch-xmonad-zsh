export LESS="-R"
export M2_HOME=/opt/maven/
export M2=$M2_HOME/bin
export PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:~/bin:~/.cabal/bin:$PATH:$M2
export PYMACS_PYTHON=python2

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
source /usr/bin/virtualenvwrapper.sh

# Fixes java/xmonad issue with JOSM
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/.zshenv-extra 2> /dev/null
