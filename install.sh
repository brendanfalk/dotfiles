#!/usr/bin/env bash

# Exit immediately if there is any error
set -euo pipefail

# Set up local device
mkdir -p ~/proj

# Clone my dotfiles repo to ~/proj/dotfiles
git clone https://github.com/brendanfalk/dotfiles.git ~/proj/dotfiles

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Symlink mackup config file to ~/.mackup.cfg
ln -s ~/proj/dotfiles/.mackup.cfg ~/.mackup.cfg


# Install Mackup 
brew install mackup

# Install all remaining CLI tools
brew bundle --no-lock --file ~/proj/dotfiles/Mackup/.Brewfile
npm i @sitespeed.io/throttle

# Restore all configuration files
mackup restore


# Install additional fzf settings
$(brew --prefix)/opt/fzf/install --all


