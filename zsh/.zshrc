# zsh config
setopt inc_append_history
setopt share_history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

export LANG=en_GB.UTF-8
export EDITOR=vim
export VISUAL=code

alias clear="clear && printf '\e[3J'"
alias refreshenv="exec $SHELL -l"

function pathadd() {
	if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
		PATH="$1${PATH:+":$PATH"}"
	fi
}

# source private vars
if [ -f ~/.priv ]; then
	source ~/.priv
fi

# dotfiles
if [ -d ~/.files ]; then
	export DOTFILES=$HOME/.files
	export DOTFILES_BIN="$DOTFILES/bin"
	pathadd "$DOTFILES_BIN"
fi

# zgen
# export ZGEN_HOME=${ZGEN_HOME:="/usr/local/opt/zgen"}
# export ZGEN_AUTOLOAD_COMPINIT=0

# if [ -f ~/.zgenrc ]; then
# 	ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
# 	source ~/.zgenrc
# fi

# antibody
if [ $commands[antibody] ]; then
	# compinit
	autoload -Uz compinit
	for dump in ~/.zcompdump(N.mh+24); do
		compinit
	done
	compinit -C

	source ~/.antibodyrc
fi

pathadd "/usr/local/sbin"

# homebrew
if [ $commands[brew] ]; then
	export HOMEBREW_NO_AUTO_UPDATE=1
	export HOMEBREW_NO_ENV_FILTERING=1
fi

# go
if [ $commands[go] ]; then
	export GO111MODULE=on
	export GOPATH=${GOPATH:="$HOME/.go"}
	pathadd "$GOPATH/bin"
fi

export THEOS=${THEOS:="/usr/local/opt/theos"}

if type "gi" > /dev/null; then
	alias gitignore="gi"
fi

if [ $commands[term] ]; then
	alias term="term -t"
fi

# if [ $commands[hub] ]; then
# 	eval "$(hub alias -s)"
# fi

if [ $commands[direnv] ]; then
	eval "$(direnv hook zsh)"
fi

# if [ $commands[goenv] ]; then
# 	export GOENV_GOPATH_PREFIX="${GOPATH}"
# 	eval "$(goenv init - --no-rehash)"
# fi

# if [ $commands[jenv] ]; then
# 	eval "$(jenv init - --no-rehash)"
# fi

# if [ $commands[nodenv] ]; then
# 	export NODE_BUILD_DEFINITIONS="$(brew --prefix node-build-update-defs)/share/node-build"
# 	eval "$(nodenv init - --no-rehash)"
# fi

# if [ $commands[pyenv] ]; then
# 	eval "$(pyenv init - --no-rehash)"
# fi

# if [ $commands[rbenv] ]; then
# 	local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
# 	export PATH="${RBENV_SHIMS}:${PATH}"
# 	eval "$(rbenv init - --no-rehash)"
# fi

# if [ $commands[wine] ]; then
# 	wine32() {
# 		WINEPREFIX=$HOME/.wine32 wine "$@"
# 	}
# fi

# export ANDROID_HOME=${ANDROID_HOME:="/usr/local/share/android-sdk"}

# export MXE_HOME=${MXE_HOME:="/usr/local/opt/mxe"}
# pathadd "$MXE_HOME/usr/bin"
