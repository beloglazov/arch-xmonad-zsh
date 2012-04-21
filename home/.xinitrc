(sleep 10s && xset b off) &
(sleep 10s && xset r rate 350 40) &
export PATH=~/bin:$PATH
xsetroot -cursor_name left_ptr &
xmodmap -e "pointer = 1 8 3 4 5 6 7 2" &
#xmodmap -e "keycode  66 = Delete" # map caps lock to delete
numlockx &
#unclutter &
xrdb -merge ~/.Xresources
emacs --daemon
urxvtd -q -o -f
chromium &
exec ck-launch-session dbus-launch xmonad
