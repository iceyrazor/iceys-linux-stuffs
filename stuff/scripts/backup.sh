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

syncfile="stuff .bash_profile .bashrc .gtkrc-2.0 .profile .urlview .vimrc .xinitrc .Xresources .zshrc .newsboat .config/neoboot.sh .private .local/bin/lf-gadgets .config/dwm .config/gtk-3.0 .config/lf .config/picom.conf Desktop .config/obs-studio/basic .config/nvim .config/screenkey.json"
target=~/u/LINUX\ FILES/home/iceyrazor
exclude="--exclude manual-programs/OpenSeeFace --exclude **/minecraft/modpacks --exclude **/minecraft/servers --exclude **/iceys-linux-stuffs"

fsync
