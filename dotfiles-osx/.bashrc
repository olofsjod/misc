 ##
# .bashrc

 ##
# OS X fix
shopt -s checkwinsize

[ -r "/etc/bashrc_Apple_Terminal" ] && . "/etc/bashrc_Apple_Terminal"

 ##
# GoLang

GOROOT=$HOME/go

 ##
# PATH

PATH="$GOROOT/bin:/Users/medik/.local/bin:/opt/local/bin:/opt/local/sbin:$PATH"

 ##
# Prompt

PS1="[\u@\h \W $] "

 ##
# Fix åäö issue in WeeChat

LC_CTYPE="en_US.UTF-8"
LANG="$LC_CTYPE"

 ##
# Sourcing other files

source ~/.aliases
source ~/.git-completion.bash
