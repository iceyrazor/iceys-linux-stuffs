pids=$(ps -AO pid | awk '/stbar.sh|newsboat-fetch.sh/ {print $1}')
# pids=$(pstree -pla | grep stbar | sed 's,|,,g' | sed 's/  //g' | sed 's/^ //g' | sed 's/ .*//' | sed 's/[^0-9]*//g')
# pids2=$(ps -AO pid | grep "sh ./newsboat-fetch.sh" | sed 's/S.*//g' | sed 's/^ *//g')


echo $pids
$(sleep 3 && xsetroot -name "") & disown

sudo kill -KILL $pids
doas kill -KILL $pids
