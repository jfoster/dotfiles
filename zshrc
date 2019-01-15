# zsh history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

# global variables

export LANG=en_GB.UTF-8
export EDITOR=vim
export VISUAL=mate
export DOTFILES=$HOME/.files
export GOPATH=${GOPATH:="$HOME/Go"}
if [ -f /usr/libexec/java_home ]
then
	export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}
fi
export THEOS=${THEOS:="$HOME/.theos"}
export ANDROID_HOME=${ANDROID_HOME:="/usr/local/share/android-sdk"}

export GO111MODULE=on
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_FILTERING=1

if [ -f ~/.zshrc-priv ]
then
	source ~/.zshrc-priv
fi

# path variables

export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gnupg@2.0/bin:$PATH"
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$THEOS/bin:$PATH"

# shell hooks

git() {
	eval "$(hub alias -s)"
	hub "$@"
}

if which thefuck > /dev/null; then
	eval $(thefuck --alias fuck)
	eval $(thefuck --alias f)
fi

# aliases

alias dirs="dirs -v"
alias cask="brew cask"

# zgen

ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
source ~/.zgenrc
