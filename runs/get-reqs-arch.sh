#!/bin/bash
. /etc/os-release
if [ "$ID" == "artix" ] || [ "$ID" == "arch" ]; then
    sudo="sudo"
    [ doas ] && sudo="doas"

    echo GETTING MIN REQS

    $sudo pacman -S neovim rsync man-db wget git fzf grep
    $sudo pacman -S lf

    echo -------------
fi
