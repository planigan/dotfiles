#!/usr/bin/env bash

icon="$HOME/.config/i3/hex-lock-icon.png"
tmpbg='/tmp/screen.png'
tmpbg0='/tmp/screen-0.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -crop 1920x1080 -gravity East "$tmpbg"
convert "$tmpbg0" -scale 25% -scale 400% "$tmpbg"
#convert "$tmpbg" -gaussian-blur 60 "$tmpbg"
#convert "$tmpbg" -annotate 0x10 "LOCKED" -gravity North "$tmpbg" 
convert "$tmpbg" -gravity center "$icon" -composite -matte "$tmpbg"

i3lock -i "$tmpbg"
