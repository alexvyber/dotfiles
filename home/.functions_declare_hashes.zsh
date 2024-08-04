# ZSH specific
# Declare hashes for zsh
declareHashes() {
	typeset -r -A paths=(
		f "/mnt/FILER"
		s "/mnt/SHITTER"

		# HOME
		t "$HOME/tmp"
		days "$HOME/@alexvyber_repos/1000DaysOfCode"
		learn "$HOME/learn"
		config "$HOME/.config"
		nvim "$HOME/.config/nvim"
		awesome "$HOME/.config/awesome"
		books "$HOME/books"
		work "$HOME/work"
		tmp "$HOME/tmp"
		dot "$HOME/dotfiles"
        v "$HOME/@alexvyber"
		r "$HOME/@alexvyber/_repos"
	)

	for k in "${(@k)paths}" ; do hash -d $k=$paths[$k] ; done
}