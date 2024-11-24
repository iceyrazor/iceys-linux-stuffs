# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

PS1='%B%F{white}[%B%F{red}Z%B%F{magenta}%n%B%F{yellow}@%B%F{magenta}%M %B%F{cyan}%1~%B%F{white}]%B%F{default}$ '
#PS1='%B%F{white}[%B%F{red}Z%B%F{magenta}ARCH %B%F{cyan}%1~%B%F{white}]%B%F{default}$ '


# Yank to the system clipboard
function vi-yank-xclip {
   #zle vi-yank
   echo "$CUTBUFFER" | xclip -selection clipboard
}

zle -N vi-yank-xclip
bindkey -M vicmd ' y' vi-yank-xclip

source ~/stuff/scripts/system/neoboot.sh
source ~/.profile
