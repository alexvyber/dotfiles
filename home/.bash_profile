# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

. "$HOME/.cargo/env"
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

. "$HOME/.atuin/bin/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
