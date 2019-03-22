# source additional files

if [ -f ~/.zshrc-priv ]
then
	source ~/.zshrc-priv
fi

# zgen

ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
source ~/.zgenrc

# zsh history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

# shell hooks

git() {
	eval "$(hub alias -s)"
	hub "$@"
}

wine32() {
	WINEPREFIX=$HOME/.wine32 wine "$@"
}

wine64() {
	WINEPREFIX=$HOME/.wine64 wine "$@"
}

if which thefuck > /dev/null; then
	eval $(thefuck --alias fuck)
	eval $(thefuck --alias f)
fi

# aliases

alias dirs="dirs -v"
alias cask="brew cask"

# global variables

export LANG=en_GB.UTF-8
export EDITOR=vim
export VISUAL=subl

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_FILTERING=1

export DOTFILES=$HOME/.files
export GOPATH=${GOPATH:="$HOME/Go"}
export MXE_HOME=${MXE_HOME:="$HOME/.mxe"}
export THEOS=${THEOS:="$HOME/.theos"}
export ANDROID_HOME=${ANDROID_HOME:="/usr/local/share/android-sdk"}
if [ -f /usr/libexec/java_home ]; then export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}; fi

# path variables

function path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}

path "/usr/local/sbin"
path "/usr/local/opt/gnupg@2.0/bin"
path "/usr/local/opt/gpg-agent/bin"
path "/usr/local/opt/qt/bin"
path "/usr/local/opt/gettext/bin"

path "$DOTFILES/bin"
path "$HOME/.local/bin"
path "$GOPATH/bin"
path "$JAVA_HOME/bin"
path "$MXE_HOME/usr/bin"
path "$THEOS/bin"
