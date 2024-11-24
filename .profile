#!/bin/bash
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
export BROWSER="firefox"
export PREFIX=/usr
export PATH="$PATH:$HOME/stuff/scripts/system:$HOME/.cargo/bin:$HOME/stuff/scripts/system/backup"
export MANPAGER='nvim +Man!'
# export DWM_NOTIF_FILE="/home/iceyrazor/stuff/scripts/c/SDL/notif/notif.txt"

export heartost="/home/iceyrazor/.steam/root/steamapps/music/Heartbound - OST"

export cutil=/home/iceyrazor/stuff/scripts/c/my_utils

alias ls='ls --color=auto'
alias lss="sudo du -ah -d 1 | sort -hr"
alias lsu="lsblk --filter 'NAME=~\"sd[abcde]\"' -o NAME,MOUNTPOINTS"
alias lsblkfs="lsblk -o PATH,FSTYPE,MOUNTPOINT"
alias grep='grep --color=auto'
alias fastfetch='fastfetch --localip-show-ipv4 0'

alias ascii="~/stuff/scripts/c/SDL/ascii/ascii"

alias watchlss="sudo watch \"du -ah -d 1 | sort -hr\""
alias lfub=~/.local/bin/lf-gadgets/lf-ueberzug/lf-ueberzug
alias lfk=~/.local/bin/lf-gadgets/lf-kitty/lf-kitty
alias ovim=/usr/bin/vim
alias vim=nvim
alias fzf="fzf --walker-skip=.private-parent"
alias fcd="cd \"\$(fzf --walker dir,hidden --walker-skip=.private-parent)\""
alias ts="~/stuff/scripts/system/tmux-sessionizer.sh"


#alias updateL='sudo /home/iceyrazor/update_list/update_list.sh '
alias session="./Downloads/session-desktop-linux-x86_64-1.12.4.AppImage > /dev/null & disown"
alias simplex="_JAVA_AWT_WM_NONREPARENTING=1 ./Downloads/simplex-desktop-x86_64.AppImage > /dev/null & disown"
alias loki="./stuff/scripts/loki-toggle.sh"
alias lokig="sudo Lokinet-GUI.AppImage --no-sandbox > /dev/null & disown"
alias alvr="WINIT_X11_SCALE_FACTOR=\"1\" ~/stuff/app_images/ALVR-x86_64.AppImage & disown"
alias wlx="~/stuff/app_images/WlxOverlay-v1.4.5-x86_64.AppImage & disown"
alias obss="sudo obs && obs & disown"

alias killa="~/stuff/killall.sh"
alias bbackup="~/stuff/scripts/system/backup/backup.sh"
alias bbacklap="~/stuff/scripts/system/backup/backup-tol.sh"
alias bgit="~/stuff/scripts/system/backup/move-to-git.sh"
alias vasm="~/stuff/manual-programs/vasm/vasm6502_oldstyle -Fbin -dotdir "
alias pipes="pipes.sh -t 0 -p 3 -f 30 -r 2000"

alias bri="sudo ~/stuff/scripts/system/bri.sh"

# mounting
alias umsu="sudo umount u"
alias umsu2="sudo umount u2"
alias mswin="sudo mount -o umask=0,uid=nobody,gid=nobody /dev/sdb3 ~/windir"
alias umswin="sudo umount ~/windir"
alias msbak="sudo cryptsetup open /dev/sda1 backups && sudo mount /dev/mapper/backups ~/mnt-backups" # && sudo bindfs -u iceyrazor /mnt-backups ~/mnt-backups"
alias umsbak="sudo umount ~/mnt-backups && sudo cryptsetup close backups" # " sudo umount /mnt-backups && sudo cryptsetup close backups"
alias msfd="sudo mount /dev/sdc1 u2"
alias msf="sudo cryptsetup open /dev/sdc2 flashdrive && sudo mount /dev/mapper/flashdrive ~/u"
alias umsf="sudo umount ~/u && sudo cryptsetup close flashdrive"

alias cam="ffplay -input_format mjpeg -fast -fflags +nobuffer -i -framerate 30 -max_delay 100 -max_probe_packets 0 -analyzeduration 0 -flags +low_delay /dev/video0"
alias sc="ffmpeg -f x11grab -framerate 1 -video_size 1920x1200 -i :0.0 -vframes 1 -crf 18 ~/output.jpeg"
alias sc2="escrotum -s ~/Pictures/%Y-%m-%d-%H%M%S_$wx$h_escrotum.png"
alias scs="sleep 3s && ffmpeg -f x11grab -framerate 1 -video_size 1920x1200 -i :0.0 -vframes 1 -crf 18 output.jpeg"
alias wwrite="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias gol="~/stuff/scripts/c/SDL/game-of-life/game-of-life & disown"


alias statst="echo full_stat:true > ~/stuff/scripts/system/stbar/config.txt"
alias statsf="echo full_stat:false > ~/stuff/scripts/system/stbar/config.txt"

alias get_drm="sudo cat /sys/module/nvidia_drm/parameters/modeset"

alias nodem="find . -name 'node_modules' -type d | xargs du -sh | sort -hr | fzf -m --header \"select witch ones to delete\" --preview 'cat $(dirname {})/package.json'|awk print '{print $2}' | xargs -r rm -rf"

alias walltaker="stuff/manual-programs/git/walltaker-client/walltaker.sh"
alias savewall="stuff/manual-programs/git/walltaker-client/save.sh"

xset r rate 300 50
