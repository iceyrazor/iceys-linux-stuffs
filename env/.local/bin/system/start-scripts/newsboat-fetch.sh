#!/bin/bash
newsboat_loop(){
    newsboat -x reload
    #newsboat -x print-unread | xargs -0 notify-send "newsboat feed"

    unreads=$(newsboat -x print-unread)
    unreadnum=$(printf "$unreads" | sed 's/ .*//g')

    if (( $unreadnum > 0 )); then
        notify-send "newsboat feed" "$unreads"
    fi
    notify-send "Vitamins!" "take them"
    sleep 2h
    newsboat_loop
}
newsboat_loop
