#!/bin/bash

if [ "$DESKTOP_SESSION" == "i3" ] && [ -f /var/run/reboot-required ]; then
    /usr/bin/notify-send -u critical 'A system restart is required.'
fi
