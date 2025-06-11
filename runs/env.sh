#!/bin/bash
script_dir_2="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo DEPLOYING ENV

cp $script_dir_2/../env/.bashrc "$DEV_ENV"
cp $script_dir_2/../env/.bash_profile "$DEV_ENV"
cp $script_dir_2/../env/.vimrc "$DEV_ENV"
cp $script_dir_2/../env/.markdownlint.yaml "$DEV_ENV"
mkdir "$DEV_ENV/.config"
cp $script_dir_2/../env/.config/.profile "$DEV_ENV/.config"
cp -r $script_dir_2/../env/.config/nvim "$DEV_ENV/.config"
cp -r $script_dir_2/../env/.config/tmux "$DEV_ENV/.config"
cp -r $script_dir_2/../env/.config/wezterm "$DEV_ENV/.config"

echo -----------------
