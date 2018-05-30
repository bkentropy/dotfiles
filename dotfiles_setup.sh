#!/bin/bash

dotfiles=(".vimrc" ".bashrc" ".tmux.conf" ".hammerspoon/init.lua")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
    # ln -sf "${HOME}/${dotfile}" "${dir}"
    echo "${HOME}/${dotfile}" "${dir}"
done
