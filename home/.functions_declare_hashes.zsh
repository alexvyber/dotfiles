
# !!! ZSH specific !!!
# Declare hashes for zsh
# Globals: nothing
# Input:   nothing
# Output:  nothing
# TODO: MAKE this work automaticly with current folders on drives
declareHashes() {
	typeset -r -A paths=(
		# FILER
		f "/mnt/FILER"
		js "/mnt/FILER/js"
		ts "/mnt/FILER/ts"
		react "/mnt/FILER/react"
		node "/mnt/FILER/node"
		doing "/mnt/FILER/doing"

		s "/mnt/SHITTER"
		t "$HOME/tmp"

		# HOME
		days "$HOME/personal/1000days"
		cache "$HOME/.cache"
		learn "$HOME/learn"
		crm "$HOME/work/crm"
		client "$HOME/work/gate/kardon.pro/client"
		local "$HOME/.local"
		config "$HOME/.config"
		nvim "$HOME/.config/nvim"
		awesome "$HOME/.config/awesome"
		books "$HOME/books"
		work "$HOME/work"
		ex "$HOME/personal/ex"
		tmp "$HOME/tmp"
		dot "$HOME/dotfiles"
		code "$HOME/learn/code"
		p "$HOME/personal"
		k "$HOME/personal/katzen"
        v "$HOME/@alexvyber"
	)
	for k in "${(@k)paths}" ; do hash -d $k=$paths[$k] ; done
} # End of function Declare hashes for zsh