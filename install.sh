#!/bin/bash

if ln -sfv $PWD/source/.vimrc ~/.vimrc && cp -av ./source/autoload/ ./source/colors/ ~/.vim/
then
    echo "Install Successful !!!"
else
    echo "Install Failed!!!"
fi


