#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#!/bin/bash
if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi


#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export DWM_NOTIF_FILE="/home/iceyrazor/stuff/scripts/c/SDL/notif/notif.txt"
