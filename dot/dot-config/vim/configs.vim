let g:incsearch#auto_nohlsearch = 1

" don't show colorcolumn in quickfix
autocmd FileType qf let &colorcolumn=""
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

let g:one_allow_italics=1 " Turn on italics
let g:EditorConfig_exclude_patterns = ['.git/COMMIT_EDITMSG']
let g:ale_fix_on_save = 1
let g:ale_elm_make_use_global=1
let g:ale_lint_delay = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:elm_setup_keybindings = 0
let g:ale_rust_cargo_check_tests = 1
let g:haskell_indent_disable=1 " Automatic indenting and hindent don't agree
let g:localvimrc_persistent=2 " See plugin: embear/vim-localvimrc
let g:netrw_liststyle=1
" let g:polyglot_disabled = ['haskell', 'elm']
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='atomic'
let g:ale_fixers = { 'elixir': ['mix_format'] }
let &showbreak = '    ↪ '

" Use Ripgrep with CtrlSF for performance
let g:ctrlsf_ackprg = '/usr/bin/rg'

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

let no_buffers_menu=1

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 0
  let g:indentLine_concealcursor = ''
  let g:indentLine_char = '֊'
  let g:indentLine_faster = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif

let g:ale_linters = {
      \   'elm': ['make'],
      \   'haskell': ['hlint', 'hdevtools']
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'markdown': ['remove_trailing_lines'],
      \   'rust': ['rustfmt'],
      \}

" ale
"*****************************************************************************
"" Convenience variables
"*****************************************************************************

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
