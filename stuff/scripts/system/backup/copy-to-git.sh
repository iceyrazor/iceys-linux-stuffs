cd ~/

fsync () {
    rsync -RUurvn --size-only --delete-after $exclude $syncfile "$target"
    printf "===commit these changes?\n"
    read -p "y/n: " uinput
    if [ "$uinput" != "n" ] && [ "$uinput" != "N" ]; then
        printf "\n\n\n"
        rsync -PRUurv --size-only --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile=".bash_profile .bashrc .gtkrc-2.0 .wezterm.lua .profile .urlview .vimrc .Xresources .zshrc .config/dwm .config/awesome .config/rofi .config/lf .config/picom.conf .config/nvim .config/screenkey.json stuff/manual-programs/suckless"

syncfile="$syncfile stuff/scripts/system/stbar stuff/scripts/system/url-handler.sh stuff/scripts/system/backup/copy-to-git.sh stuff/scripts/system/backup/backup.sh"
syncfile="$syncfile stuff/scripts/system/neoboot.sh stuff/scripts/system/math.sh stuff/scripts/system/bri.sh stuff/scripts/system/restart-pipe.sh stuff/scripts/system/set-pri-java.sh"
target=~/stuff/iceys-linux-stuffs
exclude="--exclude check_weth.sh --exclude lua-ls-cc-tweaked --exclude .config/nvim/plugin"

fsync
