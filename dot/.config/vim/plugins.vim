
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'elixir-editors/vim-elixir'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
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


" Go language support for Vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " https://github.com/fatih/vim-g


" ··············································································
"  FROM GENERATED FILE
" ··············································································

Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse


if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ··············································································
" FROM GENERATED FILE -- END
" ··············································································



















































call plug#end()
