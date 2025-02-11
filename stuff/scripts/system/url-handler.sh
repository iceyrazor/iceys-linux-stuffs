
url=$@
prompt_message="Open with:"

echo $url

choices="
clipboard
firefox
"

choice=$(echo "$choices" | sed /^$/d | rofi -dmenu "$prompt_message")

if [ "$choice" == "clipboard" ]; then
	printf "$url" | xclip -selection clipboard
else
	$choice "$url"
fi
