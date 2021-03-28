#!/bin/bash
. "${HOME}/.cache/wal/colors.sh"

bg=$color0
border=$color2
separator=$color2
fg=$color7
bgalt=$color0
urgent=$color1
fgalt=$color7
hlbg=$color2
hlfg=$color0

# argument $1 expected to be window/run
exec rofi -show $1  -modi "window,run,ssh,drun" \
                    -width 35 \
                    -lines 15 \
                    -color-window "$bg, $fg, $border" \
                    -color-normal "$bg, $fg, $bgalt, $hlbg, $hlfg" \
                    -color-urgent "$bg, $urgent, $bgalt, $urgent, $fg" \
                    -color-active "$bg, $fg, $bgalt, $hlbg, $hlfg" \
                    -font "Iosevka 12"
                    
                    
