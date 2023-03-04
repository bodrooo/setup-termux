#!/bin/bash

cp -rf nvim $HOME && cd 

mkdir -p .local/share/nvim/plugged && mkdir -p .config/
mv -f nvim .config/
neovimPackage=("neovim" "vim-python" "nodejs-lts" "yarn")
success=0
error=0

for package in "${neovimPackage[@]}"; do
    echo -ne "installing $package              \r"
    if pkg install "$package" -y > /dev/null 2>&1;then
        ((success++))
    else
        ((error++))
    fi
done

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall

nvim