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

syncfile="stuff .surf/styles .gnupg .ssh .local/bin/lf-gadgets .config/FreeTube .config/wlxoverlay .config/newsboat .var/app/dev.vencord.Vesktop/config/vesktop/themes .config/zsh .config/vesktop/themes .keepass .config/Pinta .config/cmus .config/cava .local/share/applications/custom .local/share/osu"

# se shit
syncfile="$syncfile /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/Blueprints /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/IngameScripts /home/iceyrazor/.local/share/Steam/steamapps/compatdata/244850/pfx/drive_c/users/steamuser/AppData/Roaming/SpaceEngineers/Saves"

target="/home/iceyrazor/mnt-backups/LINUX FILES/home/iceyrazor"
exclude="--exclude node_modules --exclude node_modules_23 --exclude dontsync --exclude **/target --exclude LinVAM/pyenv"

fsynca

printf "==CC-survival unsynced?\n\n"
printf "==osu unsynced\n\n"

fsyncb
