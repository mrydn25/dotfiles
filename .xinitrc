#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Activating the custom table
# With GDM, XDM or LightDM there is no need to source ~/.Xmodmap. For startx, use: 
# modmap icin, eger sonra gerekirse bir alt satirdaki #'i kaldir
# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Add this to your .xinitrc or whatever file starts programs on startup.
# -R restores the last colorscheme that was in use.
wal -R
~/.fehbg &
exec i3
# picom --experimental-backends // bunda bir sikinti var
