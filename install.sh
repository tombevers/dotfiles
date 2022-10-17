#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and setup symlinks from the dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/zshrc $HOME/.zshrc
ln -s $DOTFILES/vimrc.local $HOME/.vimrc.local
ln -s $DOTFILES/vimrc.bundles.local $HOME/.vimrc.bundles.local
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/gitconfig $HOME/.gitconfig
ln -s $DOTFILES/gitignore $HOME/.gitignore

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Create a Code directory
mkdir $HOME/Code

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos