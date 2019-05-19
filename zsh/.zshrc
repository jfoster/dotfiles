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
export MXE_HOME=${MXE_HOME:="$HOME/.mxe"}
export THEOS=${THEOS:="/usr/local/opt/theos"}
export ZGEN_HOME=${ZGEN_HOME:="/usr/local/opt/zgen"}

# path variables

function pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH="$1${PATH:+":$PATH"}"
	fi
}

pathadd "/usr/local/sbin"
pathadd "/usr/local/opt/gettext/bin"

pathadd "$DOTFILES/bin"
pathadd "$GOPATH/bin"
pathadd "$MXE_HOME/usr/bin"

# zgen

if [ -f ~/.zgenrc ]; then
	ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
	source ~/.zgenrc
fi

# aliases + functions

alias refreshenv="exec $SHELL -l"

if type "gi" > /dev/null; then
	alias gitignore="gi"
fi

if [ $commands[hub] ]; then
	eval "$(hub alias -s)"
fi

if [ $commands[thefuck] ]; then
	eval $(thefuck --alias fuck)
fi

if [ $commands[jenv] ]; then
	java() {
		unfunction "$0"
		eval "$(jenv init - --no-rehash)"
		$0 "$@"
	}
fi

if [ $commands[nodenv] ]; then
	node() {
		unfunction "$0"
		eval "$(nodenv init - --no-rehash)"
		$0 "$@"
	}
fi

if [ $commands[pyenv] ]; then
	python() {
		unfunction "$0"
	eval "$(pyenv init - --no-rehash)"
		$0 "$@"
	}
fi

if [ $commands[rbenv] ]; then
	local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
	export PATH="${RBENV_SHIMS}:${PATH}"
	ruby() {
		unfunction "$0"
		eval "$(rbenv init - --no-rehash)"
		$0 "$@"
	}
fi

if [ $commands[wine] ]; then
	wine32() {
		WINEPREFIX=$HOME/.wine32 wine "$@"
	}
fi
