#!/bin/bash

BACKGROUND="$HOME/pictures/wallpaper/rainroad.png"

feh --bg-scale "$BACKGROUND"

emacsclient -a "" -c &

exec xmonad
