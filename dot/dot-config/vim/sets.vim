
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler

" Better command line completion
set wildmenu

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

set scrolloff=3

"" Use modeline overrides
set modeline
set modelines=10

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" ··············································································
" Main
filetype plugin indent on
syntax on

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" set encoding=utf-8
" set fileencoding=utf-8
" set fileencodings=utf-8

set completefunc=emoji#complete
set completeopt+=longest
set completeopt-=preview
" set cursorline
set expandtab

"" Enable hidden buffers
set hidden

set path=**
set shiftround
set shiftwidth=2
set wildignorecase
" set noruler " Don't show the line or character count in the cmdline.
" set nowrapscan

" Folding
" set foldenable
" set foldmethod=syntax
set incsearch
set shiftwidth=2

" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·
set termguicolors
set nolist
set guicursor=

"" Fix backspace indent
set backspace=indent,eol,start
set nowrap
