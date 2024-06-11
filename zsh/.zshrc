
export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export SAVEHIST=10000000
ZSH_THEME="theme"
export SYSTEMD_EDITOR=nvim

export GIT_EDITOR=nvim
export EDITOR=nvim
export LESSHISTFILE=-

export NODE_REPL_HISTORY=""
export ERL_AFLAGS="-kernel shell_history enabled"

export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/usr/local/go/bin:$PATH"
export PATH="$HOME/elixir/scrips/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.config/tmuxifier/bin:$PATH"
export PATH="$HOME/.spoof-dpi/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"
export PATH="/home/alexs/REPOS/depot_tools/:$PATH"
export PATH="$HOME/bin/js:$PATH"
export PATH="$$HOME/.composer/vendor/bin:$PATH"

# fix for outline
export PATH="${PATH:+${PATH}:}/usr/bin/core_perl"

# Go path
GOPATH=$HOME/.go
export GOPATH
export PATH="$PATH:/$GOPATH/bin"
export PATH=$PATH:/usr/local/go/bin

# Relocate .zcompdump files from home directory
# https://stackoverflow.com/a/71271754
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

CASE_SENSITIVE="true" # case-sensitive completion.
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false" # command auto-correction.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# // TMP VARIABLES
# GH="github.com"
# httpGH="https://github.com"
export PATH="$HOME/personal/scripts/bin:$PATH"

# Bun
export BUN_INSTALL="/home/alexs/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/alexs/.bun/_bun" ] && source "/home/alexs/.bun/_bun"

# pnpm
# export PNPM_HOME="/home/alexs/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"

# cargo
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin



# SOURCING

# Configs
source "${HOME}/.zsh/configs/zinit.zsh"
source "${ZINIT[BIN_DIR]}/zinit.zsh" # Zinit plugin manager
source "${HOME}/.zsh/plugins.zsh"    # Plugins

# Stylef fot history search
source $HOME/.zstyle
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_keybindings
source $HOME/.zsh_docker
source $HOME/.zsh_podman
source $HOME/.aliases
source $HOME/.functions
# source ~/.local/fzf/key-bindings.zsh
# source ~/.local/fzf/completion.zsh
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.oh-my-zsh/plugins/golang/golang.plugin.zsh
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# asdf
# TODO move asdf to zinit installer
. $HOME/.asdf/asdf.sh

plugins=(git docker docker-compose)

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# User configs

# Reference: http://zsh.sourceforge.net/Doc/Release/Options.html
setopt glob_dots              # glob matches files starting with dot; `*` becomes `*(D)`
setopt hist_ignore_dups       # don't add dups to history
setopt hist_find_no_dups      # don't show dups when searching history
setopt hist_expire_dups_first # IF HISTORY NEEDS TO BE TRIMMED, EVICT DUPS FIRST
setopt hist_ignore_space      # DON'T ADD COMMANDS STARTING WITH SPACE TO HISTORY
setopt hist_reduce_blanks     # REMOVE JUNK WHITESPACE FROM COMMANDS BEFORE ADDING TO HISTORY
setopt interactive_comments   # ALLOW COMMENTS IN COMMAND LINE
setopt share_history          # WRITE AND IMPORT HISTORY ON EVERY COMMAND
setopt extended_history       # WRITE TIMESTAMPS TO HISTORY
setopt bang_hist              # tREAT THE '!' CHARACTER SPECIALLY DURING EXPANSION.
setopt hist_ignore_all_dups   # dELETE OLD RECORDED ENTRY IF NEW ENTRY IS A DUPLICATE.
setopt hist_save_no_dups      # dON'T WRITE DUPLICATE ENTRIES IN THE HISTORY FILE.
setopt hist_verify            # dON'T EXECUTE IMMEDIATELY UPON HISTORY EXPANSION.
# setopt no_clobber             # don't override file with redirections if file exists

# Emulates Vim's `smartcase` for tab completion. (If lower-case, matches botch lower- and upper-case.)
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

[[ ${chpwd_functions[(r)auto_ls]} == auto_ls ]] ||
chpwd_functions=( auto_ls $chpwd_functions )

# Make beam cursor https://unix.stackexchange.com/a/496878
_fix_cursor() {
 echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

bindkey "^n" sudo-command-line # [Ctrl + N] (for Negate) Prepend/remove 'sudo' for current/previous command

# add do-ls to chpwd hook
do-ls() { exa; }
add-zsh-hook chpwd do-ls

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Creating hashes for us to be able to navigate with ~t ~f etc
declareHashes
autoload -U zmv

# tmuxifier
# eval "$(tmuxifier init -)"

# zoxide init
# eval "$(zoxide init zsh --cmd c)"

alias luamake=/home/alexs/repos/lua-language-server/3rd/luamake/luamake

# source /home/alexs/.config/broot/launcher/bash/br

# fnm
export PATH=/home/alexs/.fnm:$PATH
eval "$(fnm env --use-on-cd)"

# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# eval "$(pyenv virtualenv-init -)"

# Load Angular CLI autocompletion.
# source <(ng completion script)

# source <(kubectl completion zsh)

# pnpm
export PNPM_HOME="/home/alexs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# Bind ctrl-r but not up arrow
eval "$(atuin init zsh --disable-up-arrow)"

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# Completions.
if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]] && [[ "${words[-2]}" != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- ${words[2,-1]})"; then
                result="${__zoxide_z_prefix}${result}"
                # shellcheck disable=SC2296
                compadd -Q "${(q-)result}"
            fi
            \builtin printf '\e[5n'
        fi
        return 0
    }

    \builtin bindkey '\e[0n' 'reset-prompt'
    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete __zoxide_z
fi

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias c=__zoxide_z
\builtin alias ci=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
eval "$(zoxide init zsh)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
# export PATH="/home/alexs/.local/share/fnm:$PATH"
# eval "`fnm env`"
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
