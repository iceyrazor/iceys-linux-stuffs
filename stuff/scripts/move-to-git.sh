cd ~/

fsync () {
    rsync -Rurvn --delete-after $exclude $syncfile "$target"
    printf "===commit these changes?\n"
    read -p "y/n: " uinput
    if [ "$uinput" != "n" ] && [ "$uinput" != "N" ]; then
        printf "\n\n\n"
        rsync -Rurv --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile=".bash_profile .bashrc .gtkrc-2.0 .profile .urlview .vimrc .xinitrc .Xresources .zshrc .config/neoboot.sh .config/dwm .config/gtk-3.0 .config/lf .config/picom.conf .config/nvim .config/screenkey.json stuff/scripts/backup.sh stuff/scripts/url-handler.sh stuff/scripts/move-to-git.sh stuff/vcf.sh"
target=~/stuff/iceys-linux-stuffs

fsync
