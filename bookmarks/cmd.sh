tmux neww -n "Man TMUX" -d "man tmux"
eval <<< echo $(sed "1q;d" .shit.commands)
~/.config/kitty/kitty-themes/themes
rm ~/.config/kitty/theme.conf ; ln -s ~/.config/kitty/kitty-themes/themes/Batman.conf ~/.config/kitty/theme.conf: >> ~/.shit.commands
for pid in $(pgrep kitty) ; do kill -9 $pid ; done
for x in {1..12} ; do echo -n "F$x " ; tput kf$x | cat -A ; echo ; done
find . -type f | fzf --preview "bat --style=numbers --color=always --line-range :500 {}"
ga. && g cm "upd(dot-files): regular stuff in dot-files"
tree . -a -L 2 -I ".git|env"
