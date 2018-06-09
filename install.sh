#!/bin/sh

OPTIND=1
update=0
fonts=0
while getopts "uf" opt; do
    case "$opt" in
        u)
            update=1
            ;;
        f)
            fonts=1
            ;;
    esac
done

shift $((OPTIND-1))
cp vimrc ~/.vimrc
cp ignore ~/.agignore
cp ignore ~/.ignore

if ! $update; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if $fonts; then
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts

    ./install.sh
    cd ..
    rm -rf fonts
fi
