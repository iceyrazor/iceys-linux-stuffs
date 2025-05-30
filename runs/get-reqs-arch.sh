#!/bin/bash
sudo="sudo"
[ doas ] && sudo="doas"

echo GETTING MIN REQS

$sudo pacman -S neovim rsync man-db wget git lf fzf grep

echo -------------
