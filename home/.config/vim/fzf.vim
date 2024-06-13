

" Rg search via FZF - taken from https://github.com/junegunn/fzf.vim/blob/25bed070d83c6a230da371336829092a715edd07/README.md
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --glob "!.git/*" --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1,
      \   { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' },
      \   <bang>0)


" Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap // :BLines!<CR>       " current file buffer search
nmap ?? :Rg!<CR>           " All files in current folder search
nmap <leader>p :Files!<CR> " Current folder files search
 map \\ :Commands!<CR> " fzf-powered command search
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
