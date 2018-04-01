#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please select one of:"
  find ~/dotfiles/themes/* -maxdepth 0 -type d
  exit
fi

set -x
ln -sf $HOME/themes/$1 $HOME/.theme
ln -sf $HOME/themes/$1/.Xresources $HOME/.Xresources
