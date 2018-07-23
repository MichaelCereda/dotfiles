#!/bin/bash

THEME='powerarrow'
ln -sf $HOME/.config/awesome/themes $HOME/themes
ln -sf $HOME/.config/awesome/.xinitrc $HOME/.xinitrc
ln -sf $HOME/themes/$THEME $HOME/.theme

xinit ~/.config/awesome/.xinitrc
