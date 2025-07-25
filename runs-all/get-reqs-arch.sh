#!/bin/bash
arch="$(uname -r | grep arch)"
artix="$(uname -r | grep artix)"
if [ $artix ] || [ $arch ]; then
    sudo="sudo"
    [ doas ] && sudo="doas"

    echo GETTING ALL REQS ARCH

    # may split later. this will work for now
    # cant think of a way of using loops other than awk or something or splitting it into files and doing the same thing i did with runs
    # which i may do
    doall=0
    xorg=0
    audio=0
    hyprland=0
    vpn=0
    ime=0
    fonts=0
    vr=0
    tools=0
    misc=0
    fun=0
    paru=0

    read -p "do all? [y/N]" uin
    if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
        doall=1
    else
        read -p "paru? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            paru=1
        fi

        read -p "xorg? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            xorg=1
        fi

        read -p "audio? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            audio=1
        fi

        read -p "hyprland? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            hyprland=1
        fi

        read -p "vpn? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            vpn=1
        fi

        read -p "ime? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            ime=1
        fi

        read -p "fonts? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            fonts=1
        fi

        read -p "vr? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            vr=1
        fi

        read -p "tools? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            tools=1
        fi

        read -p "misc? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            misc=1
        fi

        read -p "fun? [y/N]" uin
        if [ "$uin" == "y" ] || [ "$uin" == "Y" ]; then
            fun=1
        fi
    fi

    # aur manager
    aurm="paru"
    if [ $doall == 1 ] || [ $paru == 1 ]; then
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
    fi


    # xorg
    [ $doall == 1 ] || [ $xorg == 1 ] && $sudo pacman -S --noconfirm xorg-server xorg-xinit libxft libxinerama

    # audio
    [ $doall == 1 ] || [ $audio == 1 ] && $sudo pacman -S --noconfirm pipewire-pulse pipewire-alsa pipewire-jack qpwgraph

    # hyprland
    [ $doall == 1 ] || [ $hyprland == 1 ] && $sudo pacman -S --noconfirm wayland hyprland waybar wlogout hyprlock xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt6-wayland qt5-wayland
    [ $doall == 1 ] || [ $hyprland == 1 ] && $aurm -S --noconfirm dunst-git sddm-theme-tokyo-night-git

    # vpn stuff
    [ $doall == 1 ] || [ $vpn == 1 ] && $sudo pacman -S --noconfirm openvpn networkmanager-openvpn openresolv

    # ime
    [ $doall == 1 ] || [ $ime == 1 ] && $sudo pacman -S --noconfirm fcitx5-im fcitx5-mozc fcitx5-im-emoji-picker-git

    # fonts
    [ $doall == 1 ] || [ $fonts == 1 ] && $sudo pacman -S --noconfirm font-manager ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts-emoji
    [ $doall == 1 ] || [ $fonts == 1 ] && $aurm -S --noconfirm ttf-b612

    # for vr
    [ $doall == 1 ] || [ $vr == 1 ] && $sudo pacman -S --noconfirm cli11 eigen glib2 glib2-devel nlohmann-json patch

    # tools
    [ $doall == 1 ] || [ $tools == 1 ] && $sudo pacman -S --noconfirm zsh bat ntfs-3g inetutils doas atuin gvfs-mtp btop htop wezterm rxvt-unicode lf ripgrep rofi-wayland networkmanager

    # misc
    [ $doall == 1 ] || [ $misc == 1 ] && $sudo pacman -S --noconfirm v4l2loopback-dkms sddm lxappearance reflector gnome-keyring seahorse yt-dlp grim slurp libnotify
    [ $doall == 1 ] || [ $misc == 1 ] && $aurm -S --noconfirm obs-studio-git gpu-screen-recorder gpu-screen-recorder-gtk urlview 

    # fun
    [ $doall == 1 ] || [ $fun == 1 ] && $sudo pacman -S --noconfirm fastfetch cmus vlc cowsay openrgb steam

    echo ---------------
fi
