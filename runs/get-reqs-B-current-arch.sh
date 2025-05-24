#!/bin/bash
arch="$(uname -r | grep arch)"
artix="$(uname -r | grep artix)"
if [ $artix ] || [ $arch ]; then
sudo="sudo"
[ doas ] && sudo="doas"

echo GETTING CURRENT REQS ARCH

$sudo pacman -S xorg-server libxft libxinerama pipewire-pulse pipewire-alsa pipewire-jack qpwgraph wezterm ttf-inconsolata sddm wayland hyprland waybar xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk zsh vlc v4l2loopback-dkms qt6-wayland qt5-wayland ntfs-3g gnome-keyring inetutils doas cowsay fastfetch yt-dlp ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts-emoji font-manager atuin gvfs-mtp bat lxappearance cmus grim btop htop rxvt-unicode lf inetutils openrgb reflector steam rofi-wayland

# for vr
$sudo pacman -S cli11 eigen glib2 glib2-devel nlohmann-json patch

# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si

paru -S dunst-git ttf-b612 sddm-theme-tokyo-night-git obs-studio-git gpu-screen-recorder gpu-screen-recorder-gtk


echo ---------------
fi
