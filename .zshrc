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
alias zc='vim ~/.zshrc'
alias vim='nvim'
alias vi='nvim'
alias la='ls -a'
alias ls='ls -l'
alias ls='ls --color=auto'
alias cat='batcat'

# fd - cd to selected directory
cd-fzf-find() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
alias fd=cd-fzf-find

vim-fzf-find() {
    local FILE=$(find ./ -path '*/\.*' -prune -o -type f -print 2> /dev/null | fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}' +m) &&
    vim "$FILE"
}
alias fv=vim-fzf-find

vim-rg-find() {
    local FILE=$(rg --files-with-matches "$1" 2> /dev/null | fzf +m) &&
    vim "$FILE"
}
alias rv=vim-rg-find

