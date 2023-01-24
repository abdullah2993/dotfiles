#!/bin/bash
vimdir=~/.config/nvim
mkdir -p $vimdir 
cd $vimdir 
curl -O https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua
cd ~
files=(".tmux.conf" ".gitconfig" ".bash_aliases")
for f in ${files[*]}; do
	echo Fetching $f
	curl -O https://raw.githubusercontent.com/abdullah2993/dotfiles/master/$f
done
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
