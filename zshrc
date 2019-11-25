# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# Begin antigen
if [[ -a $HOME/git/antigen/antigen.zsh ]]; then
    source $HOME/git/antigen/antigen.zsh

    antigen use oh-my-zsh

    # misc
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-autosuggestions

    # autocompletion stuff
    antigen bundle kubectl
    antigen bundle git
    antigen bundle httpie
    antigen bundle mosh
    antigen bundle docker

    # rust things
    antigen bundle cargo
    antigen bundle rust

    # End antigen
    antigen apply
fi

# Aliases
# alias ls='ls --color=auto --group-directories-first'
alias k='kubectl'
alias kctx='kubectl config use-context'
alias ksns='kubectl config set-context $(kubectl config current-context) --namespace'
alias stern='stern --color always'

# Add cargo to path, given that it's user-installed through rustup
if [[ -a $HOME/.cargo/env ]]; then
    source $HOME/.cargo/env
fi

# iTerm2 integration
if [[ -a $HOME/.iterm2_shell_integration.zsh ]]; then
    source $HOME/.iterm2_shell_integration.zsh
fi

# if the silver searcher is available, make fzf use it to respect .gitignore
if (( $+commands[ag] )); then
    export FZF_DEFAULT_COMMAND='ag -g ""'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PROMPT="%m %{${fg_bold[red]}%}:: %{${fg[green]}%}%5~%(0?. . %{${fg[red]}%}%? )%{${fg[blue]}%}
»%{${reset_color}%} "
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export LC_ALL=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
