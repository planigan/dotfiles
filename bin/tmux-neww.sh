#!/bin/bash
# Part of making tmux open new windows with the correct symlink
# path rather than the physical path.
# From:http://stackoverflow.com/a/33077475/6058262
pane=$(echo "$1" | tr -d '%')
pane_path=$(tmux show-environment TMUX_"$pane"_PATH | sed 's/^[^=]*=//g')
tmux set-environment NEWW "$pane_path"
tmux neww
