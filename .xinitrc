#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

## merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

## start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xsetroot -cursor_name left_ptr
#
### another method for setting wallpaper, however, picom interferes and polybar doesn't appear on top of it
## xsetroot -bg "#323d43" -fg "#465258" -mod 16 16
#~/.fehbg &
#
#pgrep -x polybar > /dev/null || polybar heusc > /dev/null 2>&1 &
#
## redshift -P -O 4538 
#
#pgrep -x picom > /dev/null || picom --experimental-backends --config /home/devpogi/.config/picom/picom.conf &
#
##pgrep -x dunst > /dev/null || dunst &
##sleep 1;
##notify-send "Welcome" "$USER" -u low
#
### will be handled by cron job later
##notify-send "don't forget to run battery_health.sh" -u normal

exec /usr/bin/bspwm
#exec /usr/bin/jwm
