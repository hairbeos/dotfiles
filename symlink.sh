#!/usr/bin/env bash
# encoding: utf-8

source functions/logs.sh

DOTFILES_ROOT=$(pwd)

# If we're on a Mac, let's install and setup homebrew.
if [[ `uname` == 'Darwin' ]];
then
  info "Symlink dotfiles ..."
  local overwrite_all=false backup_all=false skip_all=false

  # Symlink files
  for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/$(basename "${src%.*}")"
    # backup before symlink
    if [ -f "$dst" ] && [ ! -h "$dst" ]; then
      mv "$dst" "$dst.backup"
    fi
    ln -sfn "$src" "$dst"
  done

  # mkdir -p "$HOME/.dotfiles"
  # # Symlink .zsh
  # for src in $(find "$DOTFILES_ROOT" -maxdepth 2 -name '*.zsh')
  # do
  #   mkdir -p "$HOME/.dotfiles/$(basename $(dirname "$src"))"
  #   dst="$HOME/.dotfiles/$(basename $(dirname "$src"))/$(basename "$src")"
  #   ln -sfn "$src" "$dst"
  #   # echo "$dst"
  # done

  # Symlink .ssh
  if [ -d $HOME/Google\ Drive/.ssh ]; then
    ln -sfn $HOME/Google\ Drive/.ssh $HOME/.ssh
  fi

  # Symlink .tmuxinator projects
  if [ -d $DOTFILES_ROOT/.tmuxinator ]; then
    ln -sfn $DOTFILES_ROOT/.tmuxinator $HOME/.tmuxinator
  fi

  # Symlink Sublime Text packages and preferences
  if [ -d $HOME/Google\ Drive/PATAHA-MBP/Sublime/Packages ]; then
    ln -sfn $HOME/Google\ Drive/PATAHA-MBP/Sublime/Packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/
  fi

  if [ -d $HOME/Google\ Drive/PATAHA-MBP/Sublime/Installed\ Packages ]; then
    ln -sfn $HOME/Google\ Drive/PATAHA-MBP/Sublime/Installed\ Packages $HOME/Library/Application\ Support/Sublime\ Text\ 3/
  fi

  # Using zsh reload! to reload current profile
  source ~/.zshrc
fi

unset DOTFILES_ROOT
