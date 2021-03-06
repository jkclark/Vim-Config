#!/bin/bash
# Script to install my Vim setup

# Exit immediately if a command exits with a non-zero status
set -e

# Make necessary directories (only if they do not exist already)
if [ ! -d "~/.vim" ]; then
	mkdir ~/.vim
fi

if [ ! -d "~/.vim/bundle" ]; then
	mkdir ~/.vim/bundle
fi

if [ ! -d "~/.vim/colors" ]; then
	mkdir ~/.vim/colors
fi

# Move colorschemes
cp ./colors/* ~/.vim/colors/

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

# Copy vimrc over to $HOME
cat ./.vimrc > ~/.vimrc

# Install plugins
vim -c 'PluginInstall' -c 'qa!'

# Install Powerline fonts for symbols in airline
# Clone
git clone https://github.com/powerline/fonts.git --depth=1
# Install
cd fonts
./install.sh
# Clean-up
cd ..
rm -rf fonts
# Symbols still won't work, need to select font
echo '#######################################################
Note: Fonts have been installed, but you need to select
	  one for symbols to appear properly in airline
#######################################################'
