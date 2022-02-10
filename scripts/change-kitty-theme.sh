##!/usr/bin/env bash

theme_name=$(find ~/.config/kitty/kitty-themes/themes/ -type f | fzf ) 

echo "$theme_name"

rm ~/.config/kitty/theme.conf ;
ln -s "$theme_name" ~/.config/kitty/theme.conf
