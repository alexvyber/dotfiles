" hello front end masters
set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

" Yes, I am a sneaky snek now
Plug 'ambv/black'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'

" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" HARPOON!!
Plug 'mhinz/vim-rfc'

" prettier
Plug 'sbdchd/neoformat'

" should I try another status bar???
"  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'hoob3rt/lualine.nvim'
"------------------------------------------------------------------------
"================================
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
Plug 'prabirshrestha/asyncomplete-buffer.vim' " autocomplete using contents of current buffer
Plug 'ElmCast/elm-vim' " elm-format on autosave
Plug 'sheerun/vim-polyglot' " syntax highlighting for lots of things
Plug 'danro/rename.vim' " adds :Rename command
Plug 'arp242/auto_mkdir2.vim' " automatically create directories as needed when writing
call plug#end()

" Adding local modules
let &runtimepath.=',' . expand("$HOME") . '/personal/harpoon/tmux'
let &runtimepath.=',' . expand("$HOME") . '/personal/vim-with-me/ui'
let &runtimepath.=',' . expand("$HOME") . '/personal/git-worktree.nvim/master'
let &runtimepath.=',' . expand("$HOME") . '/personal/refactoring.nvim/master'
let &runtimepath.=',' . expand("$HOME") . '/personal/jvim.nvim'

" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

lua require("theprimeagen")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <silent> Q <nop>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
" Probably rename this, because its straight silly to be a worktree.
nnoremap <leader>; :lua require("theprimeagen.git-worktree").execute(vim.loop.cwd(), "just-build")<CR>

nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>gt <Plug>PlenaryTestFile
nnoremap <leader>vwm :lua require("vim-with-me").init()<CR>
nnoremap <leader>dwm :lua require("vim-with-me").disconnect()<CR>
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>
nnoremap <leader>nf :!./scripts/format.py %

nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre *.lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END





































filetype plugin indent on
syntax on

" Fix for backrgound rendering bug; see
" https://github.com/microsoft/terminal/issues/832#issuecomment-493747616
" set t_ut=""

:scriptencoding utf-8
let &showbreak = '↪ '
set completefunc=emoji#complete
set completeopt+=longest
set completeopt-=preview
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


" Register asyncomplete-buffer as a source for asyncomplete
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'whitelist': ['*'],
      \ 'blacklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ 'config': {
        \    'max_buffer_size': 5000000,
        \  },
        \ }))

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
nnoremap <F1> :tabp<CR>
nnoremap <F2> :tabn<CR>
nnoremap <Esc><F1> :tabc<CR>

" FZF
" ---------------------------------------
" Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
nmap // :BLines!<CR>       " current file buffer search
nmap ?? :Rg!<CR>           " All files in current folder search
nmap <leader>p :Files!<CR> " Current folder files search
nmap \\ :Commands!<CR> " fzf-powered command search
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" NERDTree
" ---------------------------------------
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

nnoremap <leader>q :q<CR>
nnoremap <leader>q1 :q!<CR>
nnoremap <leader>qw :wq<CR>
