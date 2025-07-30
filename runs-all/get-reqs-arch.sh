#!/bin/bash
. /etc/os-release
if [ "$ID" == "artix" ] || [ "$ID" == "arch" ]; then
    sudo="sudo"
    [ doas ] && sudo="doas"

    echo GETTING ALL REQS ARCH

    #aur
    install_aur=0
    read -p "install aur manager? [y/N]" uin
    if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
        install_aur=1
    fi

    aurm="paru"
    if [ $install_aur == 1 ]; then
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
    fi

    #ask what to install
    reqs_dir="$(find $script_dir/runs-all/get-reqs-arch -mindepth 1 -maxdepth 1 -type f -executable)"
    reqs_list=()

    for s in $reqs_dir; do
        read -p "$s? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            reqs_list+=("$s")
        fi
    done
    echo --------------

    #install
    for s in "${reqs_list[@]}"; do
        echo "running $s"
        . "$s"
    done

    echo ---------------
fi
