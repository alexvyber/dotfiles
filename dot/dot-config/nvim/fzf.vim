
" -- FZF
" -- -------------------------------------
" -- Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap // :BLines!<CR>       " current file buffer search
nmap ?? :Rg!<CR>           " All files in current folder search
nmap <leader>p :Files!<CR> " Current folder files search
 map \\ :Commands!<CR> " fzf-powered command search
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
