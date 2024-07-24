# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

. "$HOME/.cargo/env"
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

source /home/alexs/.config/broot/launcher/bash/br

. "$HOME/.atuin/bin/env"
