
url=$@
prompt_message="Open with:"

echo $url

choices="
clipboard
zen
"

choice=$(echo "$choices" | sed /^$/d | rofi -dmenu "$prompt_message")

if [ "$choice" == "clipboard" ]; then
    if [ -z $WAYLAND_DISPLAY ]; then
        printf "$url" | xclip -selection clipboard
    else
        printf "$url" | wl-copy
    fi
else
	$choice "$url"
fi
