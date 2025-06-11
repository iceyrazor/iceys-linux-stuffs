#!/bin/bash
arch="$(uname -r | grep arch)"
artix="$(uname -r | grep artix)"
if [ $artix ] || [ $arch ]; then
    sudo="sudo"
    [ doas ] && sudo="doas"

    echo GETTING MIN REQS

    $sudo pacman -S neovim rsync man-db wget git lf fzf grep

    echo -------------
fi
