#!/bin/bash

echo "Linking Hyprland setup"

rm -r ~/.config/hypr # Removing any default configs
ln -s ~/dotfiles/hypr ~/.config/hypr # Linking the dotfiles config
