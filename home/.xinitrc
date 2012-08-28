(sleep 10s && xset b off) &
(sleep 10s && xset r rate 250 45) &
export PATH=~/bin:$PATH
xset +fp /usr/share/fonts/local
xsetroot -cursor_name left_ptr &
~/.mouse
xmodmap -e "add Mod3 = Hyper_L"
#xmodmap -e "pointer = 1 8 3 4 5 6 7 2" &
#xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9 10" & # normal middle button
#xmodmap -e "keycode  66 = Delete" # map caps lock to delete
numlockx &
#unclutter &
xrdb -merge ~/.Xresources
xxkb &
emacs --daemon
urxvtd -q -o -f
chromium &
exec ck-launch-session dbus-launch xmonad
