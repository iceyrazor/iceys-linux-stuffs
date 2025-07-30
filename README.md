# hi

this is just some configs and stuffs i decided to put on my github.
eg my dotfiles

- current os Artix linux (btw)

## update 05/24/2025

i liked how primagen did his dev environment and deploying of scripts. so im making my own version

> [!NOTE]
> the pacman install scripts may not be fully what i have as i made this loong after installing software

## requirements

- for dwm or awesome
    - xorg-server
    - xorg-xinit
    - xorg-xrandr
    - xorg-xsetroot
    - libxft
    - libxinerama
- for awesome extra
    - rofi-wayland
    (works on x. my rofi command on awesome is rofi -x11 so this may be required)
- for surf
    - gcr
    - webkit2gtk
    - optional
        - gst-plugins-base
        - gst-plugins-good
        - gst-libav
        - gstreamer
- installing dwm, dmenu, and surf
    - cd into respective directory
    - sudo make clean install
    - startx # for dwm
- hyprland or sway
    - wayland
    - waybar
    - grim # needed for flameshot to work on wayland
    - xdg-deskop=portal
    - xdg-deskop=portal-hyprland
    - xdg-deskop=portal-wlr # for sway
    - xdg-deskop=portal-gtk
    - hyprpaper
    - hyprlock
    - wlogout
- for neovim
    - packer # (download script in runs/packer.sh)
- for urlview - urlview
- terminal
    - primary wezterm
    - secondary rxvt-unicode # less memory usage
- fcitx5-im
    - fcitx5-mozc
    - fcitx5-im-emoji-picker-git
- fonts
    - B612 mono
    - ttf-inconsolata
    - ttf-jetbrains-mono
    - ttf-jetbrains-mono-nerd
    - noto-fonts-emoji
    - otf-ipafont
- login
    - sddm # for hyprland. it doesnt like lightdm :<
    - lightdm # for x11
    - lightdm-gtk-greeter
- lxappearance # for setting gtk theme
- theme
    - Amy-Dark-GTK # manual download. put in /usr/share/themes
- for qt to gtk theme
    - qt6gtk2
    - qt5gtk2
- background setter - nitrogen # for x11
- numen # voice control, manual setup
- file manager
    - lf (with lf-gadgets at .local/bin)
    - pcmanfm
- shell
    - zsh
- audio
    - pipewire-alsa
    - pipewire-jack
    - pipewire-pulse
    - qpwgraph
- onscreen keys
    - screenkey
    - showmethekey # for wayland
- compositor
    - xcompmgr # primarily
    - picom # for fancy ness
- inetutils # for normal ftp
- screenshots
    - flameshot #higher rez than ffmpeg
    - ffmpeg
    - not really escrotum-git
- tor stuff
    - tor
    - torsocks
    - nyx
    - tor-browser
- notifications
    - libnotify
    - notify-send
    - dusnt
- calender
    - calcurse

## todo

- [ ] make symlink. where if -s. do symlink instead of env
- [ ] seperate installs into more scripts to have different steps in requirements. probably wont do this
- [ ] make fully portable version, all pulled and compiled version bins for just devtools.
