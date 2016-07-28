# zsh options

setopt appendhistory autocd beep extendedglob nomatch
unsetopt notify

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# Enables real-time sharing of history across terminal sessions
setopt SHARE_HISTORY

# zsh styling

zstyle ':completion:*' menu select

# zsh history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

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
	alias gg=fuck
fi

# zplug

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

if ! zplug check; then
    zplug install
fi

zplug load
