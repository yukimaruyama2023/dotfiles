#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

alias c='clear'
alias vc='vim ~/.vimrc'
alias vim='nvim'
alias vi='nvim'
alias la='ls -a'
alias ls='ls -l'
alias ls='ls --color=auto'
alias cat='batcat'
