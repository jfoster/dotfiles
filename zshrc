cd $HOME

export DOTFILES=$HOME/.files

source $DOTFILES/zshrc-cfg

source $DOTFILES/zshrc-vars
source $DOTFILES/zshrc-hooks
source $DOTFILES/zshrc-aliases

ZGEN_RESET_ON_CHANGE=($DOTFILES/zshrc-zgen)
source $DOTFILES/zshrc-zgen
