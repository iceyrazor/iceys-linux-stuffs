#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo DEPLOYING ENV

cp $script_dir/../env/.bashrc "$DEV_ENV"
cp $script_dir/../env/.bash_profile "$DEV_ENV"
cp $script_dir/../env/.vimrc "$DEV_ENV"
cp $script_dir/../env/.markdownlint.yaml "$DEV_ENV"
mkdir "$DEV_ENV/.config"
cp $script_dir/../env/.config/.profile "$DEV_ENV/.config"
cp -r $script_dir/../env/.config/nvim "$DEV_ENV/.config"
cp -r $script_dir/../env/.config/tmux "$DEV_ENV/.config"
cp -r $script_dir/../env/.config/wezterm "$DEV_ENV/.config"

echo -----------------
