# zsh history

HISTFILE=$HOME/.history
HISTSIZE=1000000
SAVEHIST=1000000

# global varibles

export LANG=en_GB.UTF-8
export EDITOR=mate

export DOTFILES=$HOME/.files

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"

export ANDROID_SDK=${ANDROID_SDK:="$HOME/Library/Android/sdk"}
if [[ -d $ANDROID_SDK ]]; then
    export PATH="$ANDROID_SDK/tools:$PATH"
    export PATH="$ANDROID_SDK/platform-tools:$PATH"
fi

export GOPATH=${GOPATH:="$HOME/Code/Go"}

export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}
if [[ -d $JAVA_HOME ]]; then
    export PATH="$JAVA_HOME/bin:$PATH"
fi

export THEOS=${THEOS:="/opt/theos"}
if [[ -d $THEOS ]]; then
    export PATH="$THEOS/bin:$PATH"
fi

# gnupg

if [[ -f ~/.gnupg/.gpg-agent-info && -n "$(pgrep gpg-agent)" ]]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
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

# zgen

ZGEN_RESET_ON_CHANGE=($HOME/.zgenrc)
source $HOME/.zgenrc
