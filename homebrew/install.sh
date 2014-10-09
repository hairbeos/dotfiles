#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  info "Installing Homebrew ..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
else
  # Update homebrew
  info "Updating Homebrew ..."
  brew update && brew doctor
fi

info "Installing Homebrew packages ..."
# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
# brew install brew-cask
# brew install grc coreutils spark

# Install Git
brew install git

# Install 7Zip
brew install p7zip

# Install Tmux and 
brew install tmux

# Cleanup
brew cleanup
