" -- NERDTree
" -- -------------------------------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1

" -- Makes NerdTree look the same everywhere
function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction
