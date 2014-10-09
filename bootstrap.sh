#!/usr/bin/env bash
#
source functions/logs.sh

DOTFILES_ROOT=$(pwd)

# If we're on a Mac, let's install and setup homebrew.
if [[ `uname` == 'Darwin' ]];
then
  info "Installing dependencies"
  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh')
  do
    source "$src"
  done

  # if source homebrew/install.sh
  # then
  #   success "Dependencies installed"
  # else
  #   fail "Error installing dependencies"
  # fi
fi

unset DOTFILES_ROOT
