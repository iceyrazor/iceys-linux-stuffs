#!/bin/bash
cd "$(dirname "$0")"

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
xrdb -merge /home/iceyrazor/.Xresources &

if [ $extra == 1 ]; then
    xrandr --dpi 90 &
    xrandr --output Virtual-1 --mode 1920x1080
fi

if [ -z "$WAYLAND_DISPLAY" ]; then
    xcompmgr &
fi

# if [ $extra == 1 ]; then
#     if [ -z $(pgrep -f stbar.sh) ]; then
#         # ~/stuff/scripts/system/stbar/stbar.sh &
#     fi
# fi

pipewire & disown
if [ -z "$(pgrep wireplumber)" ]; then
    wireplumber & disown
fi
pipewire-pulse & disown
sleep 0.5s

# fcitx5 -d
# this program running all the time causes weird key input bugs and lag. i only want to use this when typing special stuff.

if [ "$WAYLAND_DISPLAY" ] && [ -z "$(pgrep -f waybar)" ]; then
    waybar & disown
fi

if [ -z "$(pgrep -f newsboat-fetch.sh)" ]; then
    ./newsboat-fetch.sh & 
fi
if [ -z "$(pgrep -f lessons-loop.sh)" ]; then
    ./lessons-loop.sh & 
fi

if [ -z "$(pgrep wezterm)" ]; then
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

