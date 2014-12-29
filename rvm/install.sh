#!/usr/bin/env bash
#

if test ! $(which rvm) 
then
  echo "Installing RVM with Ruby ..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles
fi

echo 'Reloading RVM'
# reload rvm
source $HOME/.rvm/scripts/rvm

echo 'Installing gems...'
# Install Tmuxinator
gem install tmuxinator
