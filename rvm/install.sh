#!/usr/bin/env bash
#

if test ! $(which rvm) 
then
  info "Installing RVM with Ruby ..."
  curl -#LO https://rvm.io/mpapis.asc
  gpg --import mpapis.asc
  ruby -e "$(curl -sSL https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable --ruby)"
fi

# reload rvm
source "$HOME/.rvm/scripts/rvm"

# Install Tmuxinator
gem install tmuxinator
