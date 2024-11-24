cd ~/

fsynca () {
    # t?
    rsync -RUurvn --size-only --delete-after $exclude $syncfile "$target"
}

fsyncb () {
    printf "===confirm changes?\n"
    read -p "y/n: " uinput
    if [ "$uinput" != "n" ] && [ "$uinput" != "N" ]; then
        printf "\n\n\n"
        rsync -PRUurv --size-only --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile="stuff .bash_profile .bashrc .surf .wezterm.lua .tmux.conf .gtkrc-2.0 .profile .urlview .vimrc .xinitrc .Xresources .zshrc .newsboat .gnupg .ssh .local/bin/lf-gadgets .config/dwm .config/awesome .config/gtk-3.0 .config/rofi .config/lf .config/picom.conf .config/nvim .config/screenkey.json .config/vesktop/themes .keepass .config/Pinta"

#sync game stuff
target="/home/iceyrazor/mnt-backups/LINUX FILES/home/iceyrazor"
exclude="--exclude **/cc-survival --exclude node_modules --exclude dontsync --exclude **/iceys-linux-stuffs"


fsynca

printf "==CC-survival unsynced\n\n"

fsyncb

