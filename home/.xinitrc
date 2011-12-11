(sleep 5s && xset b off) &
(sleep 5s && xset r rate 350 40) &
xsetroot -cursor_name left_ptr &
xmodmap -e "pointer = 1 8 3 4 5 6 7 2" &
numlockx &
#unclutter &
xrdb -merge ~/.Xresources
#emacs --daemon
chromium &
exec ck-launch-session dbus-launch ~/.cabal/bin/xmonad
