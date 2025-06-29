#!/bin/bash
arch="$(uname -r | grep arch)"
artix="$(uname -r | grep artix)"
if [ $artix ] || [ $arch ]; then
    sudo="sudo"
    [ doas ] && sudo="doas"

    echo GETTING ALL REQS ARCH

    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si

    # read -p "continue? [Y/n]" uin
    # [ "$uin" == "n" ] || [ "$uin" == "N" ] && exit 0

    # xorg
    $sudo pacman -S --noconfirm xorg-server xorg-xinit libxft libxinerama

    # audio
    $sudo pacman -S --noconfirm pipewire-pulse pipewire-alsa pipewire-jack qpwgraph

    # hyprland
    $sudo pacman -S --noconfirm wayland hyprland waybar wlogout hyprlock xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt6-wayland qt5-wayland
    paru -S --noconfirm dunst-git sddm-theme-tokyo-night-git

    #vpn stuff
    $sudo pacman -S --noconfirm openvpn networkmanager-openvpn openresolv

    #ime
    $sudo pacman -S --noconfirm fcitx5-im fcitx5-mozc fcitx5-im-emoji-picker-git

    # fonts
    $sudo pacman -S --noconfirm font-manager ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts-emoji
    paru -S --noconfirm ttf-b612

    # for vr
    $sudo pacman -S --noconfirm cli11 eigen glib2 glib2-devel nlohmann-json patch

    # tools
    $sudo pacman -S --noconfirm zsh bat ntfs-3g inetutils doas atuin gvfs-mtp btop htop wezterm rxvt-unicode lf ripgrep rofi-wayland networkmanager

    # misc
    $sudo pacman -S --noconfirm v4l2loopback-dkms sddm lxappearance reflector gnome-keyring yt-dlp grim
    paru -S --noconfirm obs-studio-git gpu-screen-recorder gpu-screen-recorder-gtk urlview flameshot-git

    # fun
    $sudo pacman -S --noconfirm fastfetch cmus vlc cowsay openrgb steam

    echo ---------------
fi
