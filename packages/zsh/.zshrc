# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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

# export BAT_THEME="DarkNeon"
# export BAT_THEME="gruvbox-dark"
# export BAT_THEME="Nord"
export BAT_THEME="Catppuccin Mocha"

# ln -sf "/home/maruyama/eza-themes/themes/dracula.yml" ~/.config/eza/theme.yml
# ln -sf "/home/maruyama/eza-themes/themes/default.yml" ~/.config/eza/theme.yml
ln -sf "/home/maruyama/eza-themes/themes/catppuccin.yml" ~/.config/eza/theme.yml

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias reset='~/workspace/reset_metrics_array/reset'
alias c='clear'
alias vc='vim ~/.vimrc'
alias zc='vim ~/.zshrc'
alias tc='vim ~/.tmux.conf'
alias sz='source ~/.zshrc'
alias st='tmux source ~/.tmux.conf'
alias vim='nvim'
alias vi='nvim'
alias ls='eza -F'
alias la='eza -aF'
alias ll='eza -lF'
alias lla='eza -laF'
alias lal='eza -laF'
alias sl='eza -F'
alias ta='tmux a'
alias tn='tmux new-session -s'
alias tnd='tmux new-session -d -s'
alias cat='batcat' # for Linux
alias lg='lazygit' # for Linux
# alias cat='bat' # for Mac
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gr='git remote'
alias gd='git diff'
alias gb='git branch'
alias gs='git switch'
alias ..='cd ../'
alias ...='cd ../../'

# fd - cd to selected directory
cd-fzf-find() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf-tmux -p +m) &&
  cd "$dir"

  local exit_code=$? 
  if [ "$exit_code" -ne 0 ]; then
    return 0
  fi
}
alias fd=cd-fzf-find

vim-fzf-find() {
  local FILE=$(find ./ -path '*/\.*' -prune -o -type f -print 2> /dev/null | fzf-tmux -p --preview 'batcat --style=numbers --color=always --theme="Catppuccin Mocha" --line-range :500 {}' +m)
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

# zi-popup() {
#     local dir
#     dir=$(zoxide query -l | fzf-tmux -p 60%,40%) && cd "$dir"
# }
# alias zi=zi-popup

# Use fzf for Ctrl-R
bindkey '^R' history-incremental-search-backward
source /usr/share/doc/fzf/examples/key-bindings.zsh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(starship init zsh)"

# change fzf them to catppuccin
export FZF_DEFAULT_OPTS="--color=bg:#1e1e2e,fg:#cdd6f4 --color=hl:#f38ba8,hl+:#f38ba8 --color=info:#74c7ec,prompt:#a6e3a1,pointer:#cba6f7 --color=marker:#cba6f7,spinner:#f9e2af --color=header:#cdd6f4"

export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init zsh)"

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
