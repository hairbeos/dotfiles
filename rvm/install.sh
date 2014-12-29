#!/usr/bin/env bash
#

if test ! $(which rvm) 
then
  info "Installing RVM with Ruby ..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
  ruby -e "$(curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable --ruby --auto-dotfiles)"
fi

# reload rvm
source "$HOME/.rvm/scripts/rvm"

# Install Tmuxinator
gem install tmuxinator
