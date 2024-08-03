
# !!! ZSH specific !!!
# Declare hashes for zsh
# Globals: nothing
# Input:   nothing
# Output:  nothing
# TODO: MAKE this work automaticly with current folders on drives
declareHashes() {
	typeset -r -A paths=(
		f "/mnt/FILER"
		s "/mnt/SHITTER"

		# HOME
		t "$HOME/tmp"
		days "$HOME/personal/1000days"
		cache "$HOME/.cache"
		learn "$HOME/learn"
		config "$HOME/.config"
		nvim "$HOME/.config/nvim"
		awesome "$HOME/.config/awesome"
		books "$HOME/books"
		work "$HOME/work"
		tmp "$HOME/tmp"
		dot "$HOME/dotfiles"
		p "$HOME/personal"
        v "$HOME/@alexvyber"
		r "$HOME/@alexvyber/_repos"
	)
	for k in "${(@k)paths}" ; do hash -d $k=$paths[$k] ; done
} # End of function Declare hashes for zsh