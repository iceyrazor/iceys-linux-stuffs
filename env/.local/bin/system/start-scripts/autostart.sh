#!/bin/bash
extra=0
if [ "$(cat /etc/hostname)" == "Kasino" ]; then
    extra=0
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

if [ -z "$WAYLAND_DISPLAY "]; then
    xcompmgr &
fi

if [ $extra == 1 ]; then
    if [ -z $(pgrep -f stbar.sh) ]; then
        # ~/stuff/scripts/system/stbar/stbar.sh &
        echo hall
    fi
fi

pipewire & disown
if [ -z $(pgrep wireplumber) ]; then
    wireplumber & disown
fi
pipewire-pulse & disown
sleep 0.5s

if [ "$WAYLAND_SESSION" ]; then
    waybar & disown
fi

if [ -z $(pgrep -f newsboat-fetch.sh) ]; then
    ~/.config/dwm/newsboat-fetch.sh & 
fi
if [ -z $(pgrep -f lessons-loop.sh) ]; then
    ~/.config/dwm/lessons-loop.sh & 
fi

if [ -z $(pgrep wezterm) ]; then
    sleep 2
    wezterm -e ~/stuff/scripts/system/task.sh &
fi

if [ "$(cat /etc/hostname)" == "Kasino" ]; then
    if [ -z "$(pgrep vesktop)" ]; then
        sleep 2s
        flatpak run dev.vencord.Vesktop & disown
    fi

    if [ -z "$(pgrep gajim)" ]; then
        sleep 2s
        gajim & disown
    fi

    if [ -z "$(pgrep steam)" ]; then
        sleep 3s
        steam & disown
    fi
fi
