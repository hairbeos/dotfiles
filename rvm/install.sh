#!/usr/bin/env bash
#

if ! which rvm >/dev/null; then
  info "Installing RVM with Ruby ..."
  ruby -e "$(curl -sSL https://get.rvm.io | bash -s stable --ruby)" > /tmp/rvm-install.log
fi

# Install Tmuxinator
gem install tmuxinator
