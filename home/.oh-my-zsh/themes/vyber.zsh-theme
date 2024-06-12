# PS1="${FG[237]}\${(l.\$(afmagic_dashes)..-.)}%{$reset_color%}"

# TODO: make the stripe between outputs like in af-magic
# DONE: PROMPT="${fg[white]%}\${(l.\$COLUMNS..·.)}%{$reset_color%}%(?:%{$fg_bold[green]%}✓:%{$fg_bold[red]%}✗)"

PROMPT="%{$reset_color%}%(?:%{$fg_bold[green]%}✓:%{$fg_bold[red]%}✗)"
PROMPT+=' %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)'

# RPROMPT+=' %{$fg[blue]%}  🐙 $( node -v)  🐙 $( python --version) %{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}•"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"

# oh-my-zsh Theme
# Default robbyrussell theme with node version info.
# Installation: place this file in .oh-my-zsh/custom/themes/robbyrussell.zsh_theme

function node_prompt_version {
	if which node &>/dev/null; then
		echo "%{$fg[blue]%}$(node -v )%{$reset_color%}%"
	fi
}

# function elixir_prompt_version {
# 	if which elixir &>/dev/null; then
# 		echo "%{$fg[magenta]%} $(elixir --version | tail -1 | cut -d" " -f2-2) %{$reset_color%}%"
# 	fi
# }

RPROMPT='$(node_prompt_version)'
# RPROMPT='$(node_prompt_version) $(elixir_prompt_version)'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
