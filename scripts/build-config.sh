#!/bin/bash

DOTS_PATH=~/dotfiles

ln -s $DOTS_PATH/.config/* ~/.config
ln -s $DOTS_PATH/.local/* ~/.local
ln -s $DOTS_PATH/themes ~/.themes
ln -s $DOTS_PATH/icons ~/icons
