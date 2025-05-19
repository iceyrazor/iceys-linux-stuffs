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
        rsync -RUurv --progress --size-only --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile="stuff .bash_profile .bashrc .surf/styles .gtkrc-2.0 .urlview .vimrc .xinitrc .Xresources .zshrc .p10k.zsh .gnupg .ssh .local/bin/lf-gadgets .config/dwm .config/wezterm .config/.profile .config/tmux .config/wireplumber .config/FreeTube .config/awesome .config/wlxoverlay .config/newsboat .config/vesktop/themes .config/fastfetch .config/gtk-3.0 .config/rofi .config/lf .config/mutt .config/zsh .config/picom.conf .config/nvim .config/atuin .config/screenkey.json .config/vesktop/themes .keepass .config/Pinta .config/cmus .config/cava .local/share/applications/custom .local/share/osu"

# se shit
syncfile="$syncfile /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/Blueprints /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/IngameScripts /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/Saves"

target="/home/iceyrazor/mnt-backups/LINUX FILES/home/iceyrazor"
exclude="--exclude node_modules --exclude node_modules_23 --exclude dontsync --exclude **/iceys-linux-stuffs --exclude **/target --exclude LinVAM/pyenv"

fsynca

printf "==CC-survival unsynced?\n\n"
printf "==osu unsynced\n\n"

fsyncb
