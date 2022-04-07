" -- NERDTree
" -- -------------------------------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
function! ToggleNERDTree()
  " Makes NerdTree look the same everywhere
  NERDTreeToggle
  silent NERDTreeMirror
endfunction
nmap <leader>n :call ToggleNERDTree()<CR>
