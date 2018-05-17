# zsh history

HISTFILE=$HOME/.history
HISTSIZE=100000
SAVEHIST=100000

# global variables

export LANG=en_GB.UTF-8

export EDITOR=vim
export VISUAL=mate

export DOTFILES=$HOME/.files

export PROJECTS=$HOME/Projects

source ~/.zshrc-priv

# high priority path variables

export PATH="$DOTFILES/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gnupg@2.0/bin:$PATH"
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

export ANDROID_HOME=${ANDROID_HOME:="/usr/local/share/android-sdk"}

export GOPATH=${GOPATH:="$HOME/Go"}
export PATH="$GOPATH/bin:$PATH"

export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}
export PATH="$JAVA_HOME/bin:$PATH"

export THEOS=${THEOS:="$HOME/.theos"}
export PATH="$THEOS/bin:$PATH"

# low priority path variables

export PATH="$PATH:/Applications/Wine Stable.app/Contents/Resources/wine/bin"

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

if which gpg-agent > /dev/null && ! pgrep -x "gpg-agent" > /dev/null; then
    if [ -f ~/.gnupg/.gpg-agent-info ]; then
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