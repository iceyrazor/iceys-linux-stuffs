nitrogen --restore
sh ~/stuff/scripts/stbar/stbar.sh & disown
newsboat -x reload & disown
sleep 2
urxvt -e ~/stuff/scripts/task.sh
