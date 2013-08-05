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
# ¥í¥°¥¤¥ó¥·¥§¥ë¤È¤·¤Æzsh¤¬µ¯Æ°¤µ¤ì¤¿¾ì¹ç
# 1 ~/.zshenv
# 2 ~/.zprofile
# 3 ~/.zshrc
# 4 ~/.zlogin
#
# ¥¤¥ó¥¿¥é¥¯¥Æ¥£¥Ö¥·¥§¥ë¡Ê¥í¥°¥¤¥ó¥·¥§¥ë¤È¤·¤Æ¤Ç¤Ï¤Ê¤¤¡Ë¤È¤·¤Æ
# zsh¤¬µ¯Æ°¤µ¤ì¤¿¾ì¹ç
# 1 ~/.zshenv
# 2 ~/.zshrc
#
# ¥·¥§¥ë¥¹¥¯¥ê¥×¥È¤ò¼Â¹Ô¤¹¤ë¥³¥Þ¥ó¥É¤È¤·¤Æzsh¤¬µ¯Æ°¤µ¤ì¤¿¾ì¹ç
# 1 ~/.zshenv
#
# ¥í¥°¥¤¥ó¥·¥§¥ë¤È¤·¤Æµ¯Æ°¤µ¤ì¤¿zsh¤«¤é¥í¥°¥¢¥¦¥È¤¹¤ë¾ì¹ç
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
if [[ -x /usr/local/bin/grep ]]; then
    # GNU grep
    alias grep='GREP_COLORS=ne /usr/local/bin/grep --color=always'
else
    # GNU grep old version
    alias grep='grep --color=auto'
fi
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
fpath=(~/.zsh/completion ~/github/zsh-completions/src $fpath)

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

compdef _gcc clang33
compdef _gcc c++46
#compdef cpp46
compdef _gcc g++46
compdef _gcc gcc46
#compdef gcov46
#compdef gfortran46
compdef _gcc x86_64-portbld-freebsd9.1-c++46
compdef _gcc x86_64-portbld-freebsd9.1-g++46
compdef _gcc x86_64-portbld-freebsd9.1-gcc-4.6.3
compdef _gcc x86_64-portbld-freebsd9.1-gcc46
#compdef x86_64-portbld-freebsd9.1-gfortran46
compdef _gcc c++49
#compdef cpp49
compdef _gcc g++49
#compdef gcc-ar49
compdef _nm gcc-nm49
compdef _ranlib gcc-ranlib49
compdef _gcc gcc49
#compdef gcov49
#compdef gfortran49
compdef _gcc x86_64-portbld-freebsd9.1-c++49
compdef _gcc x86_64-portbld-freebsd9.1-g++49
compdef _gcc x86_64-portbld-freebsd9.1-gcc-4.9.0
#compdef x86_64-portbld-freebsd9.1-gcc-ar49
compdef _nm x86_64-portbld-freebsd9.1-gcc-nm49
compdef _ranlib x86_64-portbld-freebsd9.1-gcc-ranlib49
compdef _gcc x86_64-portbld-freebsd9.1-gcc49
#compdef x86_64-portbld-freebsd9.1-gfortran49

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

