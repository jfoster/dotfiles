# zsh history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

# global variables

export LANG=en_GB.UTF-8

export EDITOR=vim
export VISUAL=mate

export API_KEY="a97e4b54607c"

export DOTFILES=$HOME/.files
export LOCAL=$HOME/.local

export PROJECTS=$HOME/Projects

# path variables

export PATH="/usr/local/sbin:$PATH"
export PATH="$LOCAL/bin:$PATH"

export GOPATH=${GOPATH:="$PROJECTS/Go"}
if [[ -d $GOPATH ]]; then
	export PATH="$GOPATH/bin:$PATH"
fi

export ANDROID_HOME=${ANDROID_HOME:="$HOME/Library/Android/sdk"}
if [[ -d $ANDROID_HOME ]]; then
	export PATH="$ANDROID_HOME/tools:$PATH"
	export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}
if [[ -d $JAVA_HOME ]]; then
	export PATH="$JAVA_HOME/bin:$PATH"
fi

export THEOS=${THEOS:="$HOME/.theos"}
if [[ -d $THEOS ]]; then
	export PATH="$THEOS/bin:$PATH"
fi

# shell hooks

if which nodenv > /dev/null; then 
    eval "$(nodenv init -)"
fi

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

if which hub > /dev/null; then
    eval "$(hub alias -s)"
fi

if which thefuck > /dev/null; then
    eval "$(thefuck --alias fuck)"
fi

if which gpg-agent > /dev/null; then
    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
        source ~/.gnupg/.gpg-agent-info
        export GPG_AGENT_INFO
    else
        eval $(gpg-agent --daemon)
    fi
fi

# aliases

alias dirs="dirs -v"

# zgen

ZGEN_RESET_ON_CHANGE=(~/.zgenrc)
source ~/.zgenrc
