#
# from /usr/local/share/examples/zsh/zlogin
#
# .zlogin is sourced in login shells.  It should
# contain commands that should be executed only in
# login shells.  It should be used to set the terminal
# type and run a series of external commands (fortune,
# msgs, from, etc).
#
# 仮想ターミナルでシェルを開くと .zlogin は読まれない。
# stty などによる端末制御は .zshrc に書く方がよい。

uptime
fortune
#log
