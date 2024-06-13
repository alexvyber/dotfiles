# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alexs/.local/share/nvim/site/pack/packer/start/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/alexs/.local/share/nvim/site/pack/packer/start/fzf/bin"
fi

eval "$(fzf --bash)"
