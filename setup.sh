#!/bin/sh

# ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf  ~/.tmux.conf

# Check if Neovim is installed
if ! command -v nvim &> /dev/null
# if command -v nvim &> /dev/null
then
    echo "Neovim is not installed. Installing..."
    
    # Install Neovim
    # Ubuntu / Debian
    if [ "$(uname)" == "Linux" ]; then
        # Linux
        echo "Detected Linux. Installing Neovim..."
        sudo apt-get update
        sudo apt-get install neovim
        echo "Neovim has been installed."
    elif [ "$(uname)" == "Darwin" ]; then
        # macOS
        echo "Detected macOS. Installing Neovim..."
        brew install neovim
        echo "Neovim has been installed."
    else
        echo "Unsupported operating system: $(uname)"
    fi
else
    echo "Neovim is already installed"
fi

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -d ~/.config/nvim/colors ]; then
    mkdir -p ~/.config/nvim/colors
fi

# ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
# ln -sf ~/dotfiles/.config/nvim/colors/iceberg.vim ~/.config/nvim/colors/iceberg.vim

# Vim-Plug のインストール．Lazy-Vim を使うときには必要なくなるだろう．
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d ~/.zsh ]; then
    mkdir -p ~/.zsh
fi

if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

if [ ! -d ~/.zsh/pure ]; then
    git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
fi

if [ ! -d ~/.tmux ]; then
    mkdir -p ~/.tmux
    ln -sf ~/dotfiles/.tmux/tomorrow_tmuxline.conf ~/.tmux/tomorrow_tmuxline.conf
fi
