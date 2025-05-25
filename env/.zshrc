# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

~/.local/bin/system/neoboot.sh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

PS1='%B%F{white}[%B%F{magenta}%n%B%F{yellow}@%B%F{magenta}%M %B%F{cyan}%1~%B%F{white}]%B%F{default}$ '
#PS1='%B%F{white}[%B%F{red}Z%B%F{magenta}ARCH %B%F{cyan}%1~%B%F{white}]%B%F{default}$ '


bindkey -v
# Yank to the system clipboard
function vi-yank-xclip {
   zle vi-yank
   echo "$CUTBUFFER" | xclip -selection clipboard
}

zle -N vi-yank-xclip
bindkey -M vicmd ' y' vi-yank-xclip

#fzf search
source <(fzf --zsh)

source ~/.config/.profile
#bash --login -i -c 'source ~/.profile'
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# bindkey -a h backward-char
# bindkey -a i forward-char
# bindkey -a n down-history
# bindkey -a e up-history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


eval "$(atuin init zsh)"
