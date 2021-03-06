filetype plugin indent on
syntax on

" Fix for backrgound rendering bug; see
" https://github.com/microsoft/terminal/issues/832#issuecomment-493747616
" set t_ut=""

:scriptencoding utf-8
let &showbreak = '↪ '
set completefunc=emoji#complete
set completeopt+=longest
"set completeopt-=preview
set cursorline
set nocompatible
set expandtab
set hidden
set mouse=a
set noswapfile
set number
set relativenumber
set path=**
set shiftround
set shiftwidth=2
set showcmd
set splitright
set tabstop=2
set ttyfast " removed in nvim
set undodir=~/tmp/vim/undo
set undofile
set wildignorecase
set noruler " Don't show the line or character count in the cmdline.

" Taken from https://github.com/rakr/vim-one (Credit: joshdick)
if (has("termguicolors"))
  set termguicolors
endif

set clipboard=unnamed,unnamedplus

let mapleader = " "

" Plugin configuration
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
let g:polyglot_disabled = ['haskell', 'elm']
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='atomic'

let g:ale_fixers = { 'elixir': ['mix_format'] }

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

nnoremap <leader>e :ALEDetail<cr> " Show errors on leader-e

" Save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Pasting over a selection shouldn't alter the clipboard - via https://stackoverflow.com/a/7797434
xnoremap p pgvy

" Perform fuzzy file searching
nnoremap <C-P> mN:Files<cr>
nnoremap <C-B> mN:Buffers<CR>
nnoremap <C-/> mN:Lines<cr>
nnoremap <leader><leader> mN:Commands<cr>
nnoremap <leader>/ mN:History/<cr>
nnoremap <leader>: mN:History:<cr>
nnoremap <leader>? mN:Helptags<cr>

" Hightlight all incremental search results
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Autocmds
augroup customCommands
  autocmd FileType elm set tabstop=4
  autocmd FileType elm set shiftwidth=4
  autocmd FileType roc set tabstop=4
  autocmd FileType roc set shiftwidth=4
  autocmd!
augroup END

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'elixir-editors/vim-elixir'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

Plug 'scrooloose/nerdtree' " file tree
Plug 'alexvyber/vim-one' " theme (includes both One Dark and One Light)
Plug 'dense-analysis/ale' " Asynchronous linter
Plug 'haya14busa/incsearch.vim' " Improved incremental searching
Plug 'machakann/vim-highlightedyank' " highlighted yank
Plug 'mhinz/vim-startify' " startup page
Plug 'bronson/vim-visual-star-search' " select text, then press * or # to search for it
Plug 'tpope/vim-commentary' " (Un)commenting lines
Plug 'tpope/vim-repeat' " Use dot operator with plugins
Plug 'tpope/vim-sensible' " Defaults everyone can agree on
Plug 'tpope/vim-surround' " Commands to work with surroundings
Plug 'junegunn/fzf' " fuzzy finder for files/buffers/etc
Plug 'junegunn/fzf.vim' " vim plugin for fzf
Plug 'stefandtw/quickfix-reflector.vim' "  Make quickfix window editable
Plug 'vim-airline/vim-airline' " status line replacement
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/asyncomplete.vim' " autocomplete
" Plug 'prabirshrestha/asyncomplete-buffer.vim' " autocomplete using contents of current buffer
Plug 'ElmCast/elm-vim' " elm-format on autosave
Plug 'sheerun/vim-polyglot' " syntax highlighting for lots of things
Plug 'danro/rename.vim' " adds :Rename command
Plug 'arp242/auto_mkdir2.vim' " automatically create directories as needed when writing
call plug#end()

" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>






" Register asyncomplete-buffer as a source for asyncomplete
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"      \ 'name': 'buffer',
"      \ 'whitelist': ['*'],
"      \ 'blacklist': ['go'],
"      \ 'completor': function('asyncomplete#sources#buffer#completor'),
"      \ 'config': {
"      \    'max_buffer_size': 5000000,
"      \  },
"      \ }))

" Tab completion for asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Use this theme:
set background=light " for the light version
colorscheme one

nnoremap <leader><CR> :so ~/.vimrc<CR>

" How to change theme witout forking | more in README
" call one#highlight('vimLineComment', '00ff00', 'ff0000', 'underline')

" show colorcolumn at 81+ characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermfg=0 ctermbg=8 cterm=none

" don't show colorcolumn in quickfix
autocmd FileType qf let &colorcolumn=""

" Enable vim-sneak labels
let g:sneak#label = 1

" Ctrl-backspace deletes previous word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" HIGHLIGHTEDYANK PLUGIN
let g:highlightedyank_highlight_duration = 250

let g:ale_linters = { 'haskell': ['hlint', 'hdevtools'] }

" Have Ale only run on save
let g:ale_lint_on_text_changed = 'never'

" Next/Prev error bindings for Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Rg search via FZF - taken from https://github.com/junegunn/fzf.vim/blob/25bed070d83c6a230da371336829092a715edd07/README.md
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --glob "!.git/*" --color=always '.shellescape(<q-args>).'| tr -d "\017"', 1,
      \   { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' },
      \   <bang>0)

let g:ale_linters = {
      \   'elm': ['make'],
      \   'haskell': ['hlint', 'hdevtools']
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'markdown': ['remove_trailing_lines'],
      \   'rust': ['rustfmt'],
      \}

set viminfo='100,n$HOME/.vim/files/info/viminfo

if &term =~ "xterm"
  " normal mode caret: solid vertical block
  let &t_SI .= "\<Esc>[6 q"
  " insert mode caret: solid vertical var
  let &t_EI .= "\<Esc>[2 q"
endif

" Without this, there's a delay when changing to/from the insert mode caret
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
nnoremap <leader><leader><leader> :set list<CR>

" Vyber Custom
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap <leader>e :e ~/.vimrc<CR>
nnoremap <Esc><F1> :tabedit
nnoremap <F1> :tabp<CR>
imap     <F1> <Esc>:tabp<CR>
nnoremap <F2> :tabn<CR>
imap     <F2> <Esc>:tabn<CR>
nnoremap <Esc><F4> :tabc<CR>

" FZF
" ---------------------------------------
" Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap // :BLines!<CR>       " current file buffer search
nmap ?? :Rg!<CR>           " All files in current folder search
nmap <leader>p :Files!<CR> " Current folder files search
 map \\ :Commands!<CR> " fzf-powered command search
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" NERDTree
" ---------------------------------------
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
function! ToggleNERDTree()
  " Makes NerdTree look the same everywhere
  NERDTreeToggle
  silent NERDTreeMirror
endfunction
nmap <leader>n :call ToggleNERDTree()<CR>

" TODO decide wheather I need it or not
" CtrlSF searc and edit file in-place with Edit Mode
" https://github.com/dyng/ctrlsf.vim
" ---------------------------------------

" Set "<leader>s" to substitute the word under the cursor. Works great with
" CtrlSF!
" nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Set up some handy CtrlSF bindings
" nmap <leader>a :CtrlSF -R ""<Left>
" nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
" nmap <leader>c :CtrlSFFocus<CR>
" nmap <leader>C :CtrlSFToggle<CR>

" Use Ripgrep with CtrlSF for performance
" let g:ctrlsf_ackprg = '/usr/bin/rg'

nnoremap <leader>y "+y
vnoremap <leader>y "+y
