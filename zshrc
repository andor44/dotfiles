# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Begin antigen
source /home/andor/git/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# End antigen
antigen apply


# Aliases
alias ls='ls --color=auto --group-directories-first'
