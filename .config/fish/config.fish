set -x PATH "$HOME/.npm-packages/bin" "$HOME/bin" $PATH
set -x EDITOR vim
set -x CC "ccache gcc"
set -x CXX "ccache g++"

source $HOME/.local.fish
