#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='\[\e[37;1m\][\[\e[35;1m\]\u\[\e[33m\]@\[\e[35;1m\]\h \[\e[36;1m\]\W\[\e[37;1m\]]\[\e[0;1m\]∮ '

~/.local/bin/system/neoboot.sh
source ~/.config/.profile
