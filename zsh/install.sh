#!/usr/bin/env bash
#

if test ! $(which zsh)
then
  info "Installing Oh My Zsh ..."
  ruby -e "$(curl -L http://install.ohmyz.sh | sh)" > /tmp/ohmyzsh-install.log
fi
