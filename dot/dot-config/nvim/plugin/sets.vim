
filetype plugin indent on
syntax on

" -- Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" -- set guicursor=
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" -- set noshowmode
set signcolumn=yes
set isfname+=@-@
" -- set ls=0
set completeopt=menu,menuone,noselect

" -- Give more space for displaying messages.
set cmdheight=1

" -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" -- delays and poor user experience.
set updatetime=50

" -- Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
" -- hello front end masters
set path+=**

" -- Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

:scriptencoding utf-8
let &showbreak = '↪ '
set completefunc=emoji#complete
set completeopt+=longest
"set completeopt-=preview
"set cursorline
set expandtab
set hidden
set mouse=a
set noswapfile
set path=**
set shiftround
set shiftwidth=2
set showcmd
set splitright
set tabstop=2
set undodir=~/tmp/vim/undo
set undofile
set wildignorecase
set noruler " -- Don't show the line or character count in the cmdline.
" -- Without this, there's a delay when changing to/from the insert mode caret
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set hlsearch

" -- Use this theme:
set background=light " -- for the light version
colorscheme one

"    -- TODO: git rid of relativenumber, and fix current line number highlighting
"    -- Make gutter dynamically change its size to up to 4 columns.
"    signcolumn = 'auto:4',
" -- Get rid of '-- INSERT --' in command line.
" set showmode
"    -- Add 24-bit color support.
"    termguicolors = true,
"    -- Replace default interface characters.
"    fillchars = {
"      -- Window separator
"      vert = '█',
"      -- Fold marker
"      fold = ' ',
"      -- Deleted code area filler
"      diff = '╱'
"    },
"    -- Use system clipboard.
"    clipboard = 'unnamedplus',
" -- Render tab as 2 spaces.
set tabstop=2
" -- Indentation is 2 spaces.
set shiftwidth=2
" -- Automatically convert Tab to spaces.
set expandtab
" -- Snap code to indentation grid when shifting it with < and >.
set shiftround
"    -- Indent wrapped lines with the same amount of space as the beginning of the original line.
"    breakindent = true,
"    -- Additionally, indent it with this sequence:
" set showbreak = ' └ '
"    -- Instead of breaking wrapped lines at the last character that fit window, use one of the chars defined in 'breakat'.
"    linebreak = true,
"    breakat = ' -+*/=;,()[]{}',
"    -- TODO: I think I put it in there as a test, and it's actually set in indent-blankline plugin settings.
"    list = true,
"    -- Automatically reload files when they get modified.
"    autoread = true,
"    -- Things to save in a persistent session.
"    sessionoptions = {
"      'buffers',
"      'curdir',
"      'folds',
"      'help',
"      'tabpages',
"      'winsize'
"    },
" -- The minimal distance to keep between editor sides and the cursor while scrolling.
set scrolloff=8
set sidescrolloff=8
"    -- Splitting window vertacally / horizontaly puts new window on the right / below.
"    splitright = true,
"    splitbelow = true,
"    -- Timeout for triggering 'CursorHold' event (default 4000ms). Also something about swap file.
"    updatetime = 100,
"    -- Timeout for when a keymap sequence is considered completed.
"    timeoutlen = 500,
"    -- When inserting a bracket, highlight matching one.
"    showmatch = true,
"    matchtime = 3,
"    -- Ignore letter case while searching. Precise case matching can be forced with '\C'.
"    ignorecase = true,
"    -- :%s (search and replace) preview.
"    inccommand = 'split',
"    -- Open files with all folds opened by default.
"    foldenable = false,
"    -- Use my own function for fold preview formatting.
"    foldtext = foldtext_formatting,
"    -- Ignore case while explaning wildcards.
"    wildignorecase = true,
"    -- Ignored patterns while expanding wildcards.
"    wildignore = table.concat({
"      '*/.git/*',
"      '*/node_modules/*',
"      '*/__pycache__/*',
"    }, ','),
"    -- Lower priority files while expanding wildcards.
"    suffixes = table.concat({
"      '.o',
"      '.so',
"      '.obj',
"      '.dll',
"      '.exe',
"      '.jar',
"      '.log',
"      '.class',
"      '.swp',
"    }, ','),
