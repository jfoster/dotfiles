export LANG=en_GB.UTF-8
export EDITOR=mate
export DOTFILES=${DOTFILES:="$HOME/.files"}
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/local/bin:$PATH"

export JAVA_HOME=${JAVA_HOME:=$(/usr/libexec/java_home)}
if [[ -d $JAVA_HOME ]]; then
    export PATH="$JAVA_HOME/bin:$PATH"
fi

export ANDROID_SDK=${ANDROID_SDK:="$HOME/Library/Android/sdk"}
if [[ -d $ANDROID_SDK ]]; then
    export PATH="$ANDROID_SDK/tools:$PATH"
    export PATH="$ANDROID_SDK/platform-tools:$PATH"
fi

export THEOS=${THEOS:="/opt/theos"}
if [[ -d $THEOS ]]; then
    export PATH="$THEOS/bin:$PATH"
fi

if [[ -f ~/.gnupg/.gpg-agent-info && -n "$(pgrep gpg-agent)" ]]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

if which thefuck > /dev/null; then
    eval "$(thefuck --alias fuck)"
    alias f=fuck
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

# zplug

source "$HOME/.zplug/zplug"

zplug "plugins/brew", from:oh-my-zsh, if:"which brew"
zplug "plugins/brew-cask", from:oh-my-zsh, if:"which brew"

zplug "themes/philips", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

if ! zplug check --verbose
then
    zplug install
fi

zplug load
