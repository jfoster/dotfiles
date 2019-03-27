# zsh config

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

# global variables

export LANG=en_GB.UTF-8
export EDITOR=vim
export VISUAL=subl

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_FILTERING=1

export DOTFILES=$HOME/.files

export ANDROID_HOME=${ANDROID_HOME:="/usr/local/share/android-sdk"}
export GOPATH=${GOPATH:="$HOME/.Go"}
export MXE_HOME=${MXE_HOME:="/usr/local/opt/mxe"}
export THEOS=${THEOS:="/usr/local/opt/theos"}
export ZGEN_HOME=${ZGEN_HOME:="/usr/local/opt/zgen"}
#if [ -f /usr/libexec/java_home ]; then export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}; fi

# path variables

function pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH="$1${PATH:+":$PATH"}"
	fi
}

pathadd "/usr/local/sbin"
pathadd "/usr/local/opt/qt/bin"
pathadd "/usr/local/opt/gettext/bin"

pathadd "$DOTFILES/bin"
pathadd "$HOME/.local/bin"
pathadd "$GOPATH/bin"
pathadd "$JAVA_HOME/bin"
pathadd "$MXE_HOME/usr/bin"
pathadd "$THEOS/bin"

# lazy load functions

if [ $commands[hub] ]; then
	git() {
		unfunction "$0"
		eval "$(hub alias -s)"
		$0 "$@"
	}
fi

if [ $commands[jenv] ]; then
	jenv() {
		unfunction "$0"
		eval "$(command jenv init -)"
		$0 "$@"
	}
fi

wine() {
	WINEPREFIX=$HOME/.wine32 wine "$@"
}

wine64() {
	WINEPREFIX=$HOME/.wine64 wine64 "$@"
}

# aliases

if which thefuck > /dev/null; then
	eval $(thefuck --alias fuck)
	alias f="fuck"
fi

alias dirs="dirs -v"
alias refresh="exec $SHELL -l"

# source additional files

if [ -f ~/.zshrc-priv ]; then
	source ~/.zshrc-priv
fi

# zgen

if [ -f ~/.zgenrc ]; then
	ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
	source ~/.zgenrc
fi
