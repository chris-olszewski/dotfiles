#!/bin/bash

BACKGROUND="$HOME/pictures/wallpaper/bladerunner.png"

feh --bg-scale "$BACKGROUND"

emacsclient -a "" -c &

exec xmonad
