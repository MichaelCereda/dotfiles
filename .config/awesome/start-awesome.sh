#!/bin/bash

ln -sf $HOME/.config/awesome/themes $HOME/themes
ln -sf $HOME/.config/awesome/.xinitrc $HOME/.xinitrc

xinit ~/.config/awesome/.xinitrc
