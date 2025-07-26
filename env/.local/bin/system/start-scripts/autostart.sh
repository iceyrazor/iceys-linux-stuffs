#!/bin/bash
cd "$(dirname "$0")"

sleep 0.1
xset s 0
nitrogen --restore &
if [ "$XDG_CURRENT_DESKTOP" == "sway:wlroots" ]; then
    PID=$(pidof swaybg)
    swaybg -o HDMI-A-1 -i "/home/iceyrazor/stuff/media/wallpapers/6b06108fa3bc46f5.jpg" -m fill -o DP-1 -i "/home/iceyrazor/stuff/media/wallpapers/tumblr_06bbd355f3e355049446dac24f6e7c44_2c486f77_1280 ninesols.jpg" -m fill & disown
    sleep 0.4s
    kill $PID
fi

xrdb -merge /home/iceyrazor/.Xresources &

if [ -z "$WAYLAND_DISPLAY" ]; then
    xcompmgr &
    setxkbmap -option caps:swapescape
fi

#     if [ -z $(pgrep -f stbar.sh) ]; then
#         # ~/stuff/scripts/system/stbar/stbar.sh &
#     fi

# added openrc services... may go back to this later
# pipewire & disown
# if [ -z "$(pgrep wireplumber)" ]; then
#     wireplumber & disown
# fi
# pipewire-pulse & disown
sleep 0.5s

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
    wezterm -e ~/.local/bin/system/task.sh &
fi


if [ "$(cat /etc/hostname)" == "Kasino" ]; then
    if [ -z "$(pgrep vesktop)" ]; then
        sleep 2s
        dbus-run-session vesktop & disown
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

