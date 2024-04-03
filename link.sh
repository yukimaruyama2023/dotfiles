#!/bin/sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf  ~/.tmux.conf

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -d ~/.config/nvim/colors ]; then
    mkdir -p ~/.config/nvim/colors
fi

ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.config/nvim/colors/iceberg.vim ~/.config/nvim/colors/iceberg.vim

# Vim-Plug のインストール．Lazy-Vim を使うときには必要なくなるだろう．
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

