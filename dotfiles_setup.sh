#!/bin/bash

dotfiles=(".vimrc" ".profile" ".tmux.conf")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
    ln -sf "${dir}/${dotfile}" "${HOME}/${dotfile}"
    echo "${dir}/${dotfile}" "${HOME}/${dotfile}"
done
