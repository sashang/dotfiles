set -x PATH $HOME/.npm-packages/bin $HOME/bin $HOME/.gem/ruby/2.4.0/bin $PATH
set -x EDITOR vim
set -x CC "ccache gcc"
set -x CXX "ccache g++"

source $HOME/.local.fish

# OPAM configuration
. /home/sashan/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
