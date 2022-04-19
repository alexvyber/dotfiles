
" call one#highlight('vimLineComment', '00ff00', 'ff0000', 'underline')
colorscheme one
set background=light " for the light version

" show colorcolumn at 81+ characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermfg=0 ctermbg=8 cterm=none

" Enable vim-sneak labels
let g:sneak#label = 1

" HIGHLIGHTEDYANK PLUGIN
let g:highlightedyank_highlight_duration = 250
let g:ale_linters = { 'haskell': ['hlint', 'hdevtools'] }
let g:ale_lint_on_text_changed = 'never'
