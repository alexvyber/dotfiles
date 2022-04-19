call plug#begin('~/.vim/plugged')

Plug 'ambv/black'
" -- Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/lsp_extensions.nvim'

" -- Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" -- Plug 'tjdevries/nlua.nvim'
" -- Plug 'tjdevries/lsp_extensions.nvim'
" -- Neovim Tree shitter

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" -- Debugger Plugins

Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" -- Snippets
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

" -- telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'

Plug 'chriskempson/base16-vim'
" -- HARPOON!!
Plug 'mhinz/vim-rfc'
" -- prettier
Plug 'sbdchd/neoformat'

" -- should I try another status bar???
" --  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" -- Plug 'hoob3rt/lualine.nvim'

Plug 'elixir-editors/vim-elixir'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
" -- Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'scrooloose/nerdtree' " -- file tree

Plug 'alexvyber/vim-one' " -- theme (includes both One Dark and One Light)
Plug 'dense-analysis/ale' " -- Asynchronous linter
Plug 'haya14busa/incsearch.vim' " -- Improved incremental searching

Plug 'machakann/vim-highlightedyank' " -- highlighted yank
Plug 'mhinz/vim-startify' " -- startup page
Plug 'bronson/vim-visual-star-search' " -- select text, then press * or # to search for it

" Plug 'tpope/vim-commentary' " -- (Un)commenting lines
Plug 'tpope/vim-repeat' " -- Use dot operator with plugins
Plug 'tpope/vim-sensible' " -- Defaults everyone can agree on

Plug 'tpope/vim-surround' " -- Commands to work with surroundings
Plug 'junegunn/fzf' " -- fuzzy finder for files/buffers/etc
Plug 'junegunn/fzf.vim' " -- vim plugin for fzf

Plug 'stefandtw/quickfix-reflector.vim' " --  Make quickfix window editable
Plug 'vim-airline/vim-airline' " -- status line replacement
Plug 'vim-airline/vim-airline-themes'

Plug 'prabirshrestha/asyncomplete.vim' " -- autocomplete
" -- Plug 'prabirshrestha/asyncomplete-buffer.vim' " -- autocomplete using contents of current buffer
Plug 'ElmCast/elm-vim' " -- elm-format on autosave

" -- Plug 'sheerun/vim-polyglot' " -- syntax highlighting for lots of things
Plug 'danro/rename.vim' " -- adds :Rename command
Plug 'arp242/auto_mkdir2.vim' " -- automatically create directories as needed when writing

Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/refactoring.nvim'

Plug 'ayu-theme/ayu-vim'
Plug 'numToStr/Comment.nvim'
call plug#end()

lua << EOF
require('Comment').setup()
EOF

let loaded_matchparen = 1
let mapleader = " "

" -- Let The :Files command show all files in the repo (including dotfiles)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" -- let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
lua require("theprimeagen")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

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

" -- Taken from https://github.com/rakr/vim-one (Credit: joshdick)
if (has("termguicolors"))
  set termguicolors
endif

" -- Plugin configuration
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
" -- let g:polyglot_disabled = ['haskell', 'elm']
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='atomic'
let g:ale_fixers = { 'elixir': ['mix_format'] }

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

let g:incsearch#auto_nohlsearch = 1

" -- Autocmds
augroup customCommands
  autocmd FileType elm set tabstop=4
  autocmd FileType elm set shiftwidth=4
  autocmd FileType roc set tabstop=4
  autocmd FileType roc set shiftwidth=4
  autocmd!
augroup END

" -- Minimap
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1

" -- Register asyncomplete-buffer as a source for asyncomplete
" -- call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"      \ 'name': 'buffer',
"      \ 'whitelist': ['*'],
"      \ 'blacklist': ['go'],
"      \ 'completor': function('asyncomplete#sources#buffer#completor'),
"      \ 'config': {
"      \    'max_buffer_size': 5000000,
"      \  },
"      \ }))

" -- How to change theme witout forking | more in README
" -- call one#highlight('vimLineComment', '00ff00', 'ff0000', 'underline')

" -- show colorcolumn at 81+ characters
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermfg=0 ctermbg=8 cterm=none

" -- don't show colorcolumn in quickfix
autocmd FileType qf let &colorcolumn=""

" -- Enable vim-sneak labels
let g:sneak#label = 1

" -- HIGHLIGHTEDYANK PLUGIN
let g:highlightedyank_highlight_duration = 250

let g:ale_linters = { 'haskell': ['hlint', 'hdevtools'] }

" -- Have Ale only run on save
let g:ale_lint_on_text_changed = 'never'

" -- Rg search via FZF - taken from https://github.com/junegunn/fzf.vim/blob/25bed070d83c6a230da371336829092a715edd07/README.md
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
  " --normal mode caret: solid vertical block
  let &t_SI .= "\<Esc>[6 q"
  " -- insert mode caret: solid vertical var
  let &t_EI .= "\<Esc>[2 q"
endif

com! W w " Save on Uppercase W
com! Q q " Exit on Uppercase Q

" -- TODO decide wheather I need it or not
" -- CtrlSF searc and edit file in-place with Edit Mode
" -- https://github.com/dyng/ctrlsf.vim
" -- ---------------------------------------

" -- Set "<leader>s" to substitute the word under the cursor. Works great with
" -- CtrlSF!
" -- nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" -- Set up some handy CtrlSF bindings
" nmap <leader>a :CtrlSF -R ""<Left>
" nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
" nmap <leader>c :CtrlSFFocus<CR>
" nmap <leader>C :CtrlSFToggle<CR>

" -- Use Ripgrep with CtrlSF for performance
" let g:ctrlsf_ackprg = '/usr/bin/rg'
