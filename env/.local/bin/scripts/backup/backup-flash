cd ~/stuff/scripts

fsync () {
    # t?
    rsync -RUurvn --size-only --delete-after $exclude $syncfile "$target"
    printf "===commit these changes?\n"
    read - "y/n: " uinput
    if [ "$uinput" != "n" ] && [ "$uinput" != "N" ]; then
        printf "\n\n\n"
        rsync -RUurv --progress --size-only --delete-after $exclude $syncfile "$target"
        printf "\n===end sync\n---------\n\n"
    fi
}

syncfile="LINUX-SERVER1 sites"

#sync game stuff
target="/home/iceyrazor/u"
exclude=""

fsync
