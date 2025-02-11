#!/bin/bash
delim='|'

curr_dir="$(cd "$(dirname "$0")" && pwd)"
#wifi_device=$(cat $curr_dir/config.txt | grep wifi_device | sed 's/wifi_device://')
wifi_device="wlan0"
# curr_dir/check_weth.sh "$cur_dir" &



status(){

echo " "

#wifi up or no
sed "s/down/\:\(/;s/up/\:\)/" /sys/class/net/$wifi_device/operstate

echo "$delim"

if [ "$(ls /sys/class/power_supply/BAT0/)" ]; then
    bat_power=$(cat /sys/class/power_supply/BAT0/capacity)

    echo $bat_is_flash
    if (( $bat_power < 15 )); then
        bat_power=$bat_power%!!!!!!!!!!!
    else
        bat_power=$bat_power%
    fi

    echo $bat_power

    echo "$delim"
fi

#mic

[ "$(pactl get-source-mute @DEFAULT_SOURCE@)" == "Mute: no" ] && echo  || echo 󰍭

echo "$delim"

#rss

echo  $(newsboat -x print-unread|sed "s/\s.*//; s/Error:/IA/")

echo "$delim"

if [ "$(cat $curr_dir/config.txt | grep full_stat)" == "full_stat:true" ]; then
	#cpu
	echo  $(ps axch -o cmd:15,%cpu --sort=-%cpu | sed "1q")%

	echo "$delim"

	#mem
    echo  $(free -mlw | grep Mem: | sed "s/Mem\:\W*[0-9]*\W*//; s/ .*//")
	echo $(ps axch -o cmd:15,%mem --sort=-%mem | sed "1q")%

else
    #cpu
    echo  $(ps axch -o cmd:15,%cpu --sort=-%cpu | sed "1q" | sed 's/.* //')%

    #mem
    echo  $(free -mlw | grep Mem: | sed "s/Mem\:\W*[0-9]*\W*//; s/ .*//")

fi
echo "$delim"

#space
#echo \/$(df -h | grep /dev/nvme0n1p3 | sed "s/\/dev\/nvme0n1p3 *[0-9]*.[0-9]*. *[0-9]*.[0-9]*. *//" | sed "s/ .*//")

#echo \~$(df -h | grep /dev/nvme0n1p4 | sed "s/\/dev\/nvme0n1p4 *[0-9]*.[0-9]*. *[0-9]*.[0-9]*. *//" | sed "s/ .*//")
echo  $(df -h -x=used /dev/mapper/artix-root | sed '1d' | awk '{print $4}'| sed 's/[^0-9]*//g')

echo "$delim"

#weather

if [ "$(cat $curr_dir/weth_str.txt)" != "" ]; then
    printf "$(cat $curr_dir/weth_str.txt)"
    echo "$delim"
fi

}

#while :; do
    echo "$(status | tr '\n' ' '0)"
#    sleep 1s
#end
