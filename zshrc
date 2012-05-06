# Created by newuser for 4.3.2

export LANG=ja_JP.eucJP
#export LANG=ja_JP.UTF-8

path=(/opt/bin $path)
typeset -U path

export EDITOR=vim
export PAGER=lv

setopt complete_aliases

alias -s c=lv
alias -s h=lv
alias -s sh=lv
alias -s txt=lv

alias diff colordiff
alias df="df -h"
alias du="du -h"
alias less='lv -c'
# FreeBSD ls
alias ls="ls -G"
# FSF coreutils ls
#alias ls="ls --color"
alias lv='lv -c'
alias tar=gtar

bindkey -e

setopt No_Beep
setopt nolistbeep 

setopt auto_cd 
setopt auto_pushd 
setopt list_packed 
setopt noautoremoveslash
setopt extended_glob

autoload -U compinit
compinit


# historical backward/forward search with linehead string binded to ^P/^N
# Ctrl - p/n or Esc - p/n
#
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end 
#bindkey "\\ep" history-beginning-search-backward-end
#bindkey "\\en" history-beginning-search-forward-end


# LSCOLORS : FreeBSD ls
export LSCOLORS=exfxcxdxbxegedabagacad
# LS_COLORS : FSF coreutils ls
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload colors
colors
# [33m : ${fg[color]}
# [m : ${reset_color}
# PROMPT PROMPT2 PROMPT3 PROMPT4 SPROMPT
# RPROMPT RPROMPT2
# escape (Ctrl -v Esc) or \e
case ${UID} in
0)
    PROMPT="%B%{[33m%}%?#%{[m%}%b "
    PROMPT2="%B%{[37m%}%_%{[33m%}#%{[m%}%b "
    SPROMPT="%B%{[37m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    RPROMPT="%{[33m%}%/%{[37m%}]%{[m%}"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        RPROMPT="%{[37m%}[%{[31m%}${HOST%%.*}:%{[33m%}%/%{[37m%}]%{[m%}"
    ;;
*)
    PROMPT="%{[34m%}%%%{[m%} "
    PROMPT2="%{[37m%}%_%{[34m%}%%%{[m%} "
    SPROMPT="%{[37m%}%r is correct? [n,y,a,e]:%{[m%} "
    RPROMPT="%{[34m%}%/%{[37m%}]%{[m%}"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        RPROMPT="%{[37m%}[%{[32m%}${HOST%%.*}:%{[34m%}%/%{[37m%}]%{[m%}"
    ;;
esac 

#LS_COLORS see tcsh(1)
case "${TERM}" in
kterm*|xterm*)
# for white terminal
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    } 
    ;;
cons25)
    unset LANG
# for black terminal
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

[ -f ~/.zshrc.experimental ] && source ~/.zshrc.experimental
