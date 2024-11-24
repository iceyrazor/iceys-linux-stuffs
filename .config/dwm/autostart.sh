#!/bin/bash
extra=0
if [ "$(cat /etc/hostname)" == "iceynethp1" ]; then
    extra=1
fi
if [ "$(cat /etc/hostname)" == "iceyartixmain" ]; then
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
        ~/stuff/scripts/system/stbar/stbar.sh &
    fi
    nohup pipewire &
    nohup wireplumber &
    nohup pipewire-pulse &
fi
if [ -z $(pgrep -f newsboat-fetch.sh) ]; then
    ~/.config/dwm/newsboat-fetch.sh & 
fi

if [ -z $(pgrep wezterm) ]; then
    sleep 2
    wezterm -e ~/stuff/scripts/system/task.sh
fi
