#!/usr/bin/env bash

mkdir -p ~/.vim/undo/ ~/.vim/spell

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

nvim +"PlugSnapshot $HOME/vimplug-revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa
