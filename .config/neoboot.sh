if [ "$(($RANDOM % 2))" = "1" ]; then
	fastfetch | lolcat -as 1800 -S 100
else
	uwufetch | lolcat -as 1800 -S 100
fi
