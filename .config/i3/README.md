# Keybindings  
  
### start a terminal  
   **Super+Return** exec i3-sensible-terminal  
  
### kill focused window  
   **Super+Shift+q** kill  
  
### start rofi (a program launcher)  
   **Super+Shift+d** exec --no-startup-id rofi -show drun  
   **Super+d** exec --no-startup-id rofi -show run  
  
### change focus  
   **Super+h** focus left  
   **Super+j** focus down  
   **Super+k** focus up  
   **Super+l** focus right  
  
### alternatively, you can use the cursor keys:  
   **Super+Left** focus left  
   **Super+Down** focus down  
   **Super+Up** focus up  
   **Super+Right** focus right  
  
### move focused window  
   **Super+Shift+h** move left  
   **Super+Shift+j** move down  
   **Super+Shift+k** move up  
   **Super+Shift+l** move right  
  
### alternatively, you can use the cursor keys:  
   **Super+Shift+Left** move left  
   **Super+Shift+Down** move down  
   **Super+Shift+Up** move up  
   **Super+Shift+Right** move right  
  
### move workspace between monitors  
   **Super+m** move workspace to output left  
   **Super+Shift+m** move workspace to output right  
  
### split bindings (where next window will open)  
   **Super+-** split h  
   **Super+v** split v  
  
### toggle fullscreen mode for the focused container  
   **Super+f** fullscreen toggle  
  
### layout bindings  
   **Super+s** layout stacking  
   **Super+w** layout tabbed  
   **Super+e** layout toggle split  
  
### toggle tiling / floating  
   **Super+Shift+space** floating toggle  
  
### change focus between tiling / floating windows  
   **Super+space** focus mode_toggle  
  
### focus the parent container  
   **Super+Shift+a** focus parent  
  
### reload the configuration file  
   **Super+Shift+c** reload  
### restart i3 inplace (preserves your layout/session, can be used to upgrade i3)  
   **Super+Shift+r** restart  
### exit i3 (logs you out of your X session)  
   **Super+Shift+e** exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"  
  
### Lock Screen Binding  
   **Super+Shift+x** exec --no-startup-id /home/patrick/bin/lock.sh  
  
### switch to workspace  
   **Super+1** workspace $workspace1  
   **Super+2** workspace $workspace2  
   **Super+3** workspace $workspace3  
   **Super+4** workspace $workspace4  
   **Super+5** workspace $workspace5  
   **Super+6** workspace $workspace6  
   **Super+7** workspace $workspace7  
   **Super+8** workspace $workspace8  
   **Super+9** workspace $workspace9  
   **Super+0** workspace $workspace10  
  
### move focused container to workspace  
   **Super+Shift+1** move container to workspace $workspace1  
   **Super+Shift+2** move container to workspace $workspace2  
   **Super+Shift+3** move container to workspace $workspace3  
   **Super+Shift+4** move container to workspace $workspace4  
   **Super+Shift+5** move container to workspace $workspace5  
   **Super+Shift+7** move container to workspace $workspace7  
   **Super+Shift+8** move container to workspace $workspace8  
   **Super+Shift+9** move container to workspace $workspace9  
   **Super+Shift+0** move container to workspace $workspace10  
  
  
### resize window  
   **Super+r** mode "   "  
  mode "   " {  
     **Shift+h** resize shrink width 5 px or 5 ppt  
     **Shift+j** resize grow height 5 px or 5 ppt  
     **Shift+k** resize shrink height 5 px or 5 ppt  
     **Shift+l** resize grow width 5 px or 5 ppt  
     **h** resize shrink width 10 px or 10 ppt  
     **j** resize grow height 10 px or 10 ppt  
     **k** resize shrink height 10 px or 10 ppt  
     **l** resize grow width 10 px or 10 ppt  
     **Left** resize shrink width 10 px or 10 ppt  
     **Down** resize grow height 10 px or 10 ppt  
     **Up** resize shrink height 10 px or 10 ppt  
     **Right** resize grow width 10 px or 10 ppt  
     **Return** mode "default"  
     **Escape** mode "default"  
  }  
  
### kill current song  
   **Super+p** exec pkill mpg321  
  
### Pulse & Media Audio controls  
   **XF86AudioRaiseVolume** exec --no-startup-id pactl set-sink-volume $sink +5% && exec pactl play-sample audio-volume-change  
   **XF86AudioLowerVolume** exec --no-startup-id pactl set-sink-volume $sink -5% && exec pactl play-sample audio-volume-change  
   **XF86AudioMute** exec --no-startup-id pactl set-sink-mute $sink toggle  
   **XF86AudioPlay** exec playerctl play  
   **XF86AudioPause** exec playerctl pause  
   **XF86AudioNext** exec playerctl next  
   **XF86AudioPrev** exec playerctl previous  
  
# Autostart stuff  
  
#### Make the caps lock key send escape if not held over 200ms  
exec xcape -t 200 -e 'Super_L=Escape'  
#### Set caps lock to be a super key  
exec setxkbmap -option caps:super  
exec --no-startup-id command emacs25 --daemon=gui --insecure &  
exec --no-startup-id command emacs25 --daemon=terminal --insecure &  
exec --no-startup-id dropbox start  
exec --no-startup-id redshift-gtk &  
exec --no-startup-id keepassx &  
exec --no-startup-id notify-listener.py &  
exec --no-startup-id i3-msg "workspace $workspace5; exec /usr/bin/nautilus"  
exec --no-startup-id i3-msg "workspace $workspace5; exec gnome-terminal --window-with-profile=ranger --class=ranger"  
exec --no-startup-id i3-msg "workspace $workspace2; exec google-chrome"  
exec --no-startup-id i3-msg "workspace $workspace2; exec gnome-terminal --window-with-profile=htop --class=htop"  
exec --no-startup-id i3-msg "workspace $workspace8; exec gnome-terminal --window-with-profile=irssi --class=irssi" &  
  
exec --no-startup-id nm-applet  
