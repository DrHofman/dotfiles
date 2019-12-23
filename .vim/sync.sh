#!/usr/bin/env bash

mkdir -p ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +"PlugSnapshot $HOME/.vim/revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa
