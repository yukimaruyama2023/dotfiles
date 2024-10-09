# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Customize to your needs...

fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit # this is needed for display maruyama@ibaraki
# prompt pure

export BAT_THEME="DarkNeon"
# export BAT_THEME="gruvbox-dark"
# export BAT_THEME="Nord"

ln -sf "/home/maruyama/eza-themes/themes/dracula.yml" ~/.config/eza/theme.yml

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias c='clear'
alias vc='vim ~/.vimrc'
alias zc='vim ~/.zshrc'
alias tc='vim ~/.tmux.conf'
alias sz='source ~/.zshrc'
alias st='tmux source ~/.tmux.conf'
alias vim='nvim'
alias vi='nvim'
alias ls='eza'
alias la='eza -a'
alias ll='eza -l'
alias sl='eza'
# alias ls='eza --color=auto'
alias cat='batcat' # if Linux
alias lg='lazygit' # if Linux
# alias cat='bat' # if Mac
alias ..='cd ../'
alias ...='cd ../../'

# fd - cd to selected directory
cd-fzf-find() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
alias fd=cd-fzf-find

vim-fzf-find() {
  local FILE=$(find ./ -path '*/\.*' -prune -o -type f -print 2> /dev/null | fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}' +m)
  if [ -n "$FILE" ]; then
    vim "$FILE"
  fi
}
alias fv=vim-fzf-find

vim-rg-find() {
    local FILE=$(rg --files-with-matches "$1" 2> /dev/null | fzf +m) &&
    vim "$FILE"
}
alias rv=vim-rg-find

# Use fzf for Ctrl-R
bindkey '^R' history-incremental-search-backward
source /usr/share/doc/fzf/examples/key-bindings.zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
