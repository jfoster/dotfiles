# zsh config

zmodload zsh/zprof
setopt inc_append_history
setopt share_history

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

export ZGEN_AUTOLOAD_COMPINIT=0

if [ -f ~/.zgenrc ]; then
	ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
	source ~/.zgenrc
fi

# aliases + functions

alias clear="clear && printf '\e[3J'"
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
	eval "$(jenv init - --no-rehash)"
fi

if [ $commands[nodenv] ]; then
	eval "$(nodenv init - --no-rehash)"
fi

if [ $commands[pyenv] ]; then
	eval "$(pyenv init - --no-rehash)"
fi

if [ $commands[rbenv] ]; then
	local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
	export PATH="${RBENV_SHIMS}:${PATH}"
	eval "$(rbenv init - --no-rehash)"
fi

if [ $commands[wine] ]; then
	wine32() {
		WINEPREFIX=$HOME/.wine32 wine "$@"
	}
fi
