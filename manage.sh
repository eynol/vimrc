#!/bin/bash

function install() {
    mkdir -p ~/.vim
    mkdir -p ~/.config/nvim

    if [ -e ~/.vim/vimrc ]; then
        echo exist
    else
        ln $PWD/vimrc ~/.vim/vimrc
    fi

    if [ -e ~/.config/nvim/init.vim ]; then
        echo exist
    else
        ln $PWD/init.vim ~/.config/nvim/init.vim
    fi

}

function uninstall() {
    if [ -e ~/.vim/vimrc ]; then
        rm ~/.vim/vimrc
    else
        echo ni #ln $PWD/vimrc ~/.vim/vimrc
    fi

}

if [ -z "$*" ]; then
    # print help infomation
    echo " useage: ./manage.sh <action>"
    echo " <action>:"
    echo -e "\t install   # install hole project"
    echo -e "\t uninstall # uninstall hole project"
    exit 1
else
    echo "your command is $*"
fi
$*
