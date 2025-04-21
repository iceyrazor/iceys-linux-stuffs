cd ~/

fsync () {
    rsync -RUurvn --delete-after $exclude $syncfile "$target"
    printf "===commit these changes?\n"
    read -p "y/n: " uinput
    if [ "$uinput" != "n" ] && [ "$uinput" != "N" ]; then
        printf "\n\n\n"
        rsync -PRUurv --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile=".urlview .vimrc .Xresources .zshrc .p10k.zsh .config/.profile .config/wezterm .config/dwm .config/tmux .config/awesome .config/rofi .config/lf .config/picom.conf .config/nvim .config/atuin .config/screenkey.json stuff/manual-programs/suckless"

syncfile="$syncfile stuff/scripts/system/stbar stuff/scripts/system/url-handler.sh stuff/scripts/system/backup/copy-to-git.sh stuff/scripts/system/backup/backup.sh"
syncfile="$syncfile stuff/scripts/system/neoboot.sh stuff/scripts/system/math.sh stuff/scripts/system/bri.sh stuff/scripts/system/restart-pipe.sh stuff/scripts/system/set-pri-java.sh"
target=~/stuff/iceys-linux-stuffs
exclude="--exclude check_weth.sh --exclude awesome/default --exclude lua-ls-cc-tweaked --exclude .config/nvim/plugin"

fsync
