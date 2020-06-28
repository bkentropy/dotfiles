#!/bin/bash

dotfiles=(".vimrc" ".profile" ".tmux.conf")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
    ln -sfv "${dir}/${dotfile}" "${HOME}/${dotfile}"
    # echo "${dir}/${dotfile}" "${HOME}/${dotfile}"
done

source ~/.profile
tmux source ~/.tmux.conf
