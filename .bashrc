# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
=======
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
NPM_PACKAGES=${HOME}/.npm-packages
export PATH=$NPM_PACKAGES/bin:$HOME/bin:$HOME/.gem/ruby/2.4.0/bin:$HOME/dotnet:$PATH
export EDITOR=nvim
export DOTNET_ROOT=$HOME/dotnet


if ls --color &>/dev/null; then
    alias ls="ls --color"
else
    alias ls="ls -G"
fi

alias less="less -Ri"

case ${SCHROOT_CHROOT_NAME} in
"rhel6.7")
    export CC="/opt/gcc/bin/gcc"
    export CXX="/opt/gcc/bin/g++"
    ;;
"sles12")
    export CC="ccache gcc"
    export CXX="ccache g++"
    ;;
*)
    export CC=ccache\ gcc
    export CXX=ccache\ g++
    ;;
esac

function prompt_command {
    RET=$?
    export PS1=$(~/.bash_prompt_command $RET)
}
PROMPT_DIRTRIM=3
export PROMPT_COMMAND=prompt_command
test -f $HOME/.local.sh && source $HOME/.local.sh
TERM=xterm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source "/etc/profile.d/rvm.sh"
