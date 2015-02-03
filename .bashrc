# .bashrc

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi
#stop the terminal from intercepting ctrl-s and let bash
#handle it as incremetal searchc.
stty -ixon

#10000 commands in the history list.
export HISTFILESIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend
# User specific aliases and functions
#alias omake="omake -j2 --verbose"
export PATH=$PATH:$HOME/bin
export EDITOR=vim
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_CYAN="\[\033[1;36m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
export PROMPT_COMMAND='RET=$?;\
  BRANCH="";\
  ERRMSG="";\
  if [[ $RET != 0 ]]; then\
    ERRMSG=" $RET";\
  fi;\
  if which git 2>/dev/null 1>/dev/null; then\
    BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2);\
  else
    BRANCH="(git not installed)"
  fi;

export PS1="$GREEN\u@\h:${PURPLE}${SCHROOT_CHROOT_NAME} $BLUE\W $CYAN$BRANCH$RED$ERRMSG \$ $LIGHT_GRAY";'


if ls --color 2>/dev/null; then
    alias ls="ls --color"
else
    alias ls="ls -G"
fi

alias less="less -Ri"

