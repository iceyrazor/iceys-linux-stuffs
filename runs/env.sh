#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo RUNNING ENV

cp -r $script_dir/../env/.bashrc "$DEV_ENV"
cp -r $script_dir/../env/.bash_profile "$DEV_ENV"
cp -r $script_dir/../env/.vimrc "$DEV_ENV"
mkdir "$DEV_ENV/.config"
cp -r $script_dir/../env/.config/.profile "$DEV_ENV/.config"
mkdir "$DEV_ENV/.config/nvim"
cp -r $script_dir/../env/.config/nvim "$DEV_ENV/.config/nvim"
mkdir "$DEV_ENV/.config/tmux"
cp -r $script_dir/../env/.config/tmux "$DEV_ENV/.config/tmux"
mkdir "$DEV_ENV/.config/wezterm"
cp -r $script_dir/../env/.config/wezterm "$DEV_ENV/.config/wezterm"

echo -----------------
