#
# from /usr/local/share/examples/zsh/zshenv
#
# .zshenv is sourced on ALL invocations of the shell, unless the -f option is
# set.  It should NOT normally contain commands to set the command search path,
# or other common environment variables unless you really know what you're
# doing.  E.g. running "PATH=/custom/path gdb program" sources this file (when
# gdb runs the program via $SHELL), so you want to be sure not to override a
# custom environment in such cases.  Note also that .zshenv should not contain
# commands that produce output or assume the shell is attached to a tty.
#

# Set up Environment Variable
export LANG=ja_JP.UTF-8
export LC_MESSAGES=C

export EDITOR=vim
#export JLESSCHARSET="japanese"
#export JLESSGLOBALTAGS="global"
export LESSGLOBALTAGS="global"
export LESS="--RAW-CONTROL-CHARS -g -j10 --no-init --quit-if-one-screen"
#export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
export LESSOPEN="|/usr/local/bin/src-hilite-lesspipe.sh %s"
export PAGER=lv
export UIM_FEP="anthy"

#export CVS_RSH="ssh"
#export CVSEDITOR="vim"


# This kludge can be used to override some installations that put aliases for
# rm, mv, etc. into the system profiles.  Just be sure to put "unalias alias"
# in your own rc file(s) if you use this.
##alias alias=:

# Some people insist on setting their PATH here to affect things like ssh.
# Those that do should probably use $SHLVL to ensure that this only happens
# the first time the shell is started (to avoid overriding a customized
# environment).  Also, the various profile/rc/login files all get sourced
# *after* this file, so they will override this value.  One solution is to
# put your path-setting code into a file named .zpath, and source it from
# both here (if we're not a login shell) and from the .zprofile file (which
# is only sourced if we are a login shell).
##if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
##    source ~/.zpath
##fi

[ -f ~/.zshenv.local ] && source ~/.zshenv.local

