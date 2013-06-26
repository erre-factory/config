# Created by newuser for 4.3.2

#
# from /usr/local/share/examples/zsh/zshrc
#
# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

# :-)
# http://news.mynavi.jp/column/zsh/index.html
# http://gihyo.jp/dev/serial/01/zsh-book
#
# ログインシェルとしてzshが起動された場合
# 1 ~/.zshenv
# 2 ~/.zprofile
# 3 ~/.zshrc
# 4 ~/.zlogin
#
# インタラクティブシェル（ログインシェルとしてではない）として
# zshが起動された場合
# 1 ~/.zshenv
# 2 ~/.zshrc
#
# シェルスクリプトを実行するコマンドとしてzshが起動された場合
# 1 ~/.zshenv
#
# ログインシェルとして起動されたzshからログアウトする場合
# 1 ~/.zlogout

path=(/opt/bin $path)
typeset -U path

#watch=(notme)                   # watch for everybody but me
#WATCHFMT='%n %a %l from %m at %t.'


# Set up aliases
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias mv='nocorrect mv'       # no spelling correction on mv

alias cflow="cflow -ACGP" # -g : graphviz dot
alias df='df -h'
alias diff=colordiff
alias du='du -h'
alias grep='grep --color=auto'
alias less='lv -c'
# FreeBSD ls
alias ls='ls -w -G'
# FSF coreutils ls
#alias ls='ls --color'
alias lv='lv -c'
alias tar=gtar

alias -s c=lv
alias -s h=lv
alias -s sh=lv
alias -s txt=lv


# key bind
bindkey -e

# compinit
# git-completion.bash
# git-completion.zsh -> _git
fpath=(~/.zsh/completion $fpath)

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

setopt complete_aliases

# Completion Styles





# Set/unset  shell options
# automated change directory
setopt auto_cd

# cd -number
setopt auto_pushd

# complement pack
setopt list_packed

setopt noautoremoveslash
setopt extended_glob

# no beep
setopt No_Beep
setopt nolistbeep


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


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


autoload colors
colors
#
# prompt
#
# [33m : ${fg[color]}
# [m : ${reset_color}
# PROMPT PROMPT2 PROMPT3 PROMPT4 SPROMPT
# RPROMPT RPROMPT2
# escape (Ctrl -v Esc) or \e

setopt prompt_subst

export GIT_PS1_SHOWDIRTYSTATE=y
export GIT_PS1_SHOWSTASHSTATE=y
export GIT_PS1_SHOWUNTRACKEDFILES=y
export GIT_PS1_SHOWUPSTREAM=auto
# contains branch describe default
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWCOLORHINTS=y

PROMPT=' %{[37m%}[%{[32m%}${HOST%%.*}:%{[m%}%/%{[37m%}]%{[m%}
%(!.%B`whoami`%b.`whoami`)<%h>%(!.%B%{[33m%}%?#%{[m%}%b.%%) '

GITPROMPT="/usr/local/share/git-core/contrib/completion/git-prompt.sh"
[ -f "${GITPROMPT}" ] && source "${GITPROMPT}" && PROMPT='$(__git_ps1 "(%s)")
'${PROMPT}

#PROMPT='$(__git_ps1 "(%s)")
# %{[37m%}[%{[32m%}${HOST%%.*}:%{[m%}%/%{[37m%}]%{[m%}
#%(!.%B`whoami`%b.`whoami`)<%h>%(!.%B%{[33m%}%?#%{[m%}%b.%%) '

case ${UID} in
0)
    PROMPT2="%B%{[37m%}%_%{[33m%}#%{[m%}%b "
    SPROMPT="%B%{[37m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    ;;
*)
    PROMPT2="%{[37m%}%_%{[34m%}%%%{[m%} "
    SPROMPT="%{[37m%}%r is correct? [n,y,a,e]:%{[m%} "
    ;;
esac



# ls color
# LS_COLORS see tcsh(1)

#case "${TERM}" in
#kterm*|xterm*|jfbterm*)
#
# for white terminal
#export LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# for black terminal
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}



case "${TERM}" in
cons25)
    unset LANG
    ;;
*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.zshrc.experimental ] && source ~/.zshrc.experimental

