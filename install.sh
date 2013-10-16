#!/bin/sh

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

echo "Installing dotfiles"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Setting up symlinks"
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc.local ~/.vimrc.local
ln -s ~/dotfiles/vimrc.bundles.local ~/.vimrc.bundles.local
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
echo "...done"
