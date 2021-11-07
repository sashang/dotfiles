set -x PATH "$HOME/.npm-packages/bin" "$HOME/.gem/ruby/2.7.0/bin" "$HOME/.gem/ruby/2.6.0/bin" "$HOME/bin" $PATH
set -x EDITOR vim
set -x CC "ccache gcc"
set -x CXX "ccache g++"

source $HOME/.local.fish
