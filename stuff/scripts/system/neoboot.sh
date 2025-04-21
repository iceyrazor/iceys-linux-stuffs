#!/bin/bash
normal() {
    randnum=$(($RANDOM % 2))

    if [ "$randnum" == "1" ]; then
        fastfetch --localip-show-ipv4 0 | lolcat -S 100 # | lolcat -as 10000 -S 100
        # fortune | cowsay -f fox | lolcat
    else
        # fortune | cowsay -f dragon | lolcat
        uwufetch | lolcat
    fi
    printf "\n--------------------------------------------------------\n" | lolcat
    lsblk --filter 'NAME=~"sd[abcde]"' -o NAME,MOUNTPOINTS | lolcat
}

laptop() {
    if [ "$(($RANDOM % 2))" == "1" ]; then
        fastfetch --localip-show-ipv4 0 | lolcat -as 10000 -S 100
    else
        uwufetch | lolcat -as 10000 -S 100
    fi
    printf "\n--------------------------------------------------------\n" | lolcat -S 100
    lsblk --filter 'NAME=~"sd[abcde]"' -o NAME,MOUNTPOINTS | lolcat -as 10000 -S 100
}

if [[ "$(cat /etc/hostname)" == "Witchen" ]]; then
    laptop
else
    normal
fi
