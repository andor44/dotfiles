# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Begin antigen
if [[ -a $HOME/git/antigen/antigen.zsh ]]; then
    source $HOME/git/antigen/antigen.zsh

    antigen use oh-my-zsh

    # misc
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle command-not-found

    # autocompletion stuff
    antigen bundle kubectl
    antigen bundle git
    antigen bundle httpie
    antigen bundle mosh

    # rust things
    antigen bundle cargo
    antigen bundle rust

    antigen theme cypher

    # End antigen
    antigen apply
fi

# Aliases
# alias ls='ls --color=auto --group-directories-first'
alias k='kubectl'
alias kctx='kubectl config use-context'
alias ksns="kubectl config set-context $(kubectl config current-context) --namespace"

# Add cargo to path, given that it's user-installed through rustup
if [[ -a $HOME/.cargo/env ]]; then
    source $HOME/.cargo/env
fi

export EDITOR=nvim
# if the silver searcher is available, make fzf use it to respect .gitignore
if (( $+commands[ag] )); then
    export FZF_DEFAULT_COMMAND='ag -g ""'
fi

fpath=(/usr/local/share/zsh-completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
