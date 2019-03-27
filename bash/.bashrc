export HISTSIZE=100000000
export HISTFILESIZE=100000000
shopt -s histappend                      # append to history, don't overwrite it
shopt -s checkwinsize
export HISTCONTROL=ignoredups:erasedups
export PS1="[\u@\h \w](\$?)\\$ "

if [[ -d ~/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

