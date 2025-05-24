#!/bin/bash
url=$@
prompt_message="Open with:"

echo $url

choices="
clipboard
browser/xdg-open
"

choice=$(echo "$choices" | sed /^$/d | rofi -dmenu "$prompt_message")
choice=$(echo "$choice" | sed -e 's/browser\/xdg-open/xdg-open/')

if [ "$choice" == "clipboard" ]; then
    if [ -z $WAYLAND_DISPLAY ]; then
        printf "$url" | xclip -selection clipboard
    else
        printf "$url" | wl-copy
    fi
else
	$choice "$url" & disown
fi
