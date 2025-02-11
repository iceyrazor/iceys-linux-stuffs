#!/bin/bash
extra=0
if [ "$(cat /etc/hostname)" == "Kasino" ]; then
    extra=1
fi
if [ "$(cat /etc/hostname)" == "Witchen" ]; then
    extra=1
fi

sleep 0.1
xset s 0
nitrogen --restore &
if [ $extra == 1 ]; then
    xrandr --dpi 90 &
    xrandr --output Virtual-1 --mode 1920x1080
fi

xcompmgr &

if [ $extra == 1 ]; then
    if [ -z $(pgrep -f stbar.sh) ]; then
        # ~/stuff/scripts/system/stbar/stbar.sh &
        echo hall
    fi
    sleep 0.5s
    pipewire &
    if [ -z $(pgrep wireplumber) ]; then
        wireplumber &
    fi
    pipewire-pulse &
fi
if [ -z $(pgrep -f newsboat-fetch.sh) ]; then
    ~/.config/dwm/newsboat-fetch.sh & 
fi

if [ -z $(pgrep wezterm) ]; then
    sleep 2
    wezterm -e ~/stuff/scripts/system/task.sh &
fi
