#!/bin/bash
if [ -n "$BASH_SOURCE" ]; then
    # Bash or zsh (if BASH_SOURCE is defined)
    script="$BASH_SOURCE[0]"
elif [ -n "$ZSH_VERSION" ]; then
    # Zsh
    script="${(%):-%x}"
else
    # Dash or POSIX sh
    script="$0"
fi

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

#if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec sway > ~/.swaylog 2>&1
#fi

# . torsocks on
export PROMPT_EOL_MARK=""
export EDITOR="nvim"
export BROWSER="/home/iceyrazor/.local/bin/zen-x86_64.AppImage"
export PREFIX=/usr
export PATH="$PATH:$HOME/.cargo/bin:$HOME/stuff/scripts/system:$HOME/stuff/scripts/system/backup:$HOME/stuff/scripts/system/wlx:$HOME/stuff/scripts/system/youtube-playlist-cli:$HOME/.local/bin/blender-4.1.1-linux-x64:$HOME/stuff/manual-programs/app-images"
export MANPAGER='nvim +Man!'
# export DWM_NOTIF_FILE="/home/iceyrazor/stuff/scripts/c/SDL/notif/notif.txt"

export heartost="/home/iceyrazor/.steam/root/steamapps/music/Heartbound - OST"

alias fukn="sudo $@"
alias ls='ls --color=auto'
alias lss="fukn du -ahd 1 | sort -hr"
alias lsu="lsblk --filter 'NAME=~\"sd[abcde]\"' -o NAME,MOUNTPOINTS"
alias surf="WEBKIT_DISABLE_COMPOSITING_MODE=1 surf"
alias lsblkfs="lsblk -o PATH,FSTYPE,MOUNTPOINT"
alias grep='grep --color=auto'
# alias ffchar='fastfetch --logo ~/stuff/media/ICE/ascii-char.txt --logo-color-5 "light_magenta" --logo-color-1 "reset_black" --logo-color-2 "light_black" --logo-color-3 "light_blue"'
alias ffcompact='fastfetch -c $HOME/.config/fastfetch/compact.jsonc'
alias ff='fastfetch -c $HOME/.config/fastfetch/10.jsonc 2> /dev/null || fastfetch --localip-show-ipv4 0'
alias ffchar='fastfetch -c $HOME/.config/fastfetch/ascii-char.jsonc'
# alias fastfetch='fastfetch --localip-show-ipv4 0 --kitty-direct /home/iceyrazor/stuff/media/ICE/Sprite-0009.png --logo-width 40 --logo-height 20'
[ "$(cat /etc/hostname)" = "Kasino" ] && alias fukn="doas $@"
[ "$(cat /etc/hostname)" = "Kan" ] && alias fukn="doas $@"
alias numen="echo key x | fukn dotool && NUMEN_DMENU=rofi NUMEN_DMENU_OPTS='-show drun' LD_LIBRARY_PATH=/usr/lib/ numen & disown"

alias ascii="~/stuff/scripts/c/SDL/ascii/ascii"

alias watchlss="fukn watch \"du -ah -d 1 | sort -hr\""
alias lfub=~/.local/bin/lf-gadgets/lf-ueberzug/lf-ueberzug
alias lfk=~/.local/bin/lf-gadgets/lf-kitty/lf-kitty
alias ovim=/usr/bin/vim
alias vim=nvim
alias fzf="fzf --walker-skip=.private-parent"
alias fcd="cd \"\$(fzf --walker dir,hidden --walker-skip=.private-parent)\""
alias notes="cd ~/stuff/notes && vim notes.md && cd ~"
alias ts="~/stuff/scripts/system/tmux-sessionizer.sh"
alias fman="bash -c 'compgen -c' | fzf | xargs man"
alias etask="$EDITOR stuff/scripts/system/task.sh"


#alias updateL='fukn /home/iceyrazor/update_list/update_list.sh '
alias music="nohup vlc /home/iceyrazor/stuff/scripts/system/youtube-playlist-cli/title_vids > /dev/null 2> /dev/null < /dev/null & disown && cd /home/iceyrazor/stuff/scripts/system/youtube-playlist-cli/title_vids && lfk"
alias ibuss="ibus-daemon -rxRd"
alias ygg="fukn bash -c 'mkdir /var/run/yggdrasil; yggdrasil -useconf < /etc/yggdrasil.conf'"
alias alvr="WINIT_X11_SCALE_FACTOR=\"1\" /home/iceyrazor/stuff/manual-programs/dontsync/alvr_streamer_linux/bin/alvr_dashboard & disown"
alias obss="obs && obs --enable-media-stream & disown"
alias get_channel_id="xargs curl -s | grep -Eo 'channel_id=.{0,50}' | sed 's/\".*//g' | fzf | xargs printf \"https://www.youtube.com/feeds/videos.xml?%s\" | xclip -selection clipboard"

alias killa="~/stuff/killall.sh"
alias bbackup="~/stuff/scripts/system/backup/backup.sh"
alias bbacklap="~/stuff/scripts/system/backup/backup-tol.sh"
alias bgit="~/stuff/scripts/system/backup/move-to-git.sh"
alias vasm="~/stuff/manual-programs/vasm/vasm6502_oldstyle -Fbin -dotdir "
alias pipes="pipes.sh -t 0 -p 3 -f 30 -r 2000"


alias bri="fukn ~/stuff/scripts/system/bri.sh"
# alias drkwll="nitrogen --head=0 --set-zoom-fill ~/stuff/media/gallifreyan/linux2.png && nitrogen --head=1 --set-zoom-fill ~/stuff/media/gallifreyan/linux2.png"
alias drkwll="nitrogen --head=0 --set-zoom-fill ~/stuff/media/wallpapers/dark_leaves.png && nitrogen --head=1 --set-zoom-fill ~/stuff/media/wallpapers/dark_leaves.png"

# mounting
alias umsu="fukn umount u"
alias umsu2="fukn umount u2"
alias mswin="fukn mount -o umask=0,uid=nobody,gid=nobody /dev/sdb3 ~/windir"
alias umswin="fukn umount ~/windir"
alias msbak="doas cryptsetup open /dev/sda1 backups && doas mount /dev/mapper/backups ~/mnt-backups" # && fukn bindfs -u iceyrazor /mnt-backups ~/mnt-backups"
alias umsbak="doas umount ~/mnt-backups && doas cryptsetup close backups" # " fukn umount /mnt-backups && fukn cryptsetup close backups"
alias msfd="fukn mount /dev/sdc1 u2"
alias msf="fukn cryptsetup open /dev/sdc2 flashdrive && fukn mount /dev/mapper/flashdrive ~/u"
alias umsf="fukn umount ~/u && fukn cryptsetup close flashdrive"

alias cam="ffplay -input_format mjpeg -fast -fflags +nobuffer -i -framerate 30 -max_delay 100 -max_probe_packets 0 -analyzeduration 0 -flags +low_delay /dev/video0"
alias sc="ffmpeg -f x11grab -framerate 1 -video_size 1920x1200 -i :0.0 -vframes 1 -crf 18 ~/Pictures/Screenshots/$(date '+%m-%d-%Y-%I-%M')_${RANDOM}_screenshot.jpeg"
alias sccam="ffmpeg -f video4linux2 -i /dev/v4l/by-id/usb-Sonix_Technology_Co.__Ltd._USB_2.0_Camera_SN0001-video-index0 -vframes 1  -video_size 1280x720 test.jpeg"
alias sc2="escrotum -s ~/Pictures/%Y-%m-%d-%H%M%S_$wx$h_escrotum.png"
alias scs="sleep 3s && ffmpeg -f x11grab -framerate 1 -video_size 1920x1200 -i :0.0 -vframes 1 -crf 18 output.jpeg"
alias wwrite="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias gol="~/stuff/scripts/c/SDL/game-of-life/game-of-life & disown"

alias vrinit="echo key x | fukn dotool && drkwll && killall xcompmgr; sleep 1s && wlx-layout.sh main; \ 
sleep 2s && tmux new-session -s chat-loop -c stuff/scripts/rust/chat-loop"


alias statst="echo full_stat:true > ~/stuff/scripts/system/stbar/config.txt"
alias statsf="echo full_stat:false > ~/stuff/scripts/system/stbar/config.txt"

alias get_drm="fukn cat /sys/module/nvidia_drm/parameters/modeset"

alias nodem="find . -name 'node_modules' -type d | xargs du -sh | sort -hr | fzf -m --header \"select witch ones to delete\" --preview 'cat $(dirname {})/package.json'|awk print '{print $2}' | xargs -r rm -rf"

alias walltaker="stuff/manual-programs/git/walltaker-client/walltaker.sh"
alias savewall="stuff/manual-programs/git/walltaker-client/save.sh"


# alias session="./Downloads/session-desktop-linux-x86_64-1.12.4.AppImage > /dev/null & disown"
# alias simplex="_JAVA_AWT_WM_NONREPARENTING=1 ./Downloads/simplex-desktop-x86_64.AppImage > /dev/null & disown"
# alias loki="./stuff/scripts/loki-toggle.sh"
# alias lokig="fukn Lokinet-GUI.AppImage --no-sandbox > /dev/null & disown"

xset r rate 300 50
# xset r off
