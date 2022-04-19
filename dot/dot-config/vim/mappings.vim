
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
map <PageUp> <Plug>(incsearch-nohl-#)
map <PageDown>  <Plug>(incsearch-nohl-*)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Tab completion for asyncomplete
" TODO what is it?
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>

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

" Set up some handy CtrlSF bindings
nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>c :CtrlSFFocus<CR>
nmap <leader>C :CtrlSFToggle<CR>

nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>o o<CR>
nnoremap <leader><leader>o o<CR><Esc>O
nnoremap <leader>go Go<CR>
nnoremap <leader>gp Gp

" Remap from VIM book... TODO make ref to book or find plugin with analogus
" fumctinonality
inoremap <leader>' <Esc>bi'<Esc>ea'
inoremap <leader><leader>' <Esc>bi"<Esc>ea"

inoremap <leader>: <Esc>kA:<Esc>jA

" Take user input Open full-screen help on the new tab
nnoremap <leader>h :tab h <C-R>=<CR>

nnoremap <leader>e :ALEDetail<cr> " Show errors on leader-e

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><leader><leader><del> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader><del> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <leader><space> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader><leader><space> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"" Move visual block
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Paste over the word https://stackoverflow.com/a/7797434
xnoremap p pgvy

" Ctrl-backspace deletes previous word
noremap! <C-BS> <C-w>

"" Open current line on GitHub
" nnoremap <Leader>o :.Gbrowse<CR>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Split
noremap <Leader>v :<C-u>vsplit<CR>

"" Clean search (highlight)
nnoremap <silent> <space>n :noh<cr>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
noremap XX "+x<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" ··············································································
" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" ··············································································
"  Tabs

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

nnoremap <BS> gt
nnoremap = gT

" Expand all opend files into tabs
nnoremap <leader><tab> :tab all<CR>

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History<CR>

" Next/Prev error bindings for Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nmap <A-]> 10<C-e>
nmap <A-[> 10<C-y>

" ··············································································
"  Service Mappings

nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <leader><leader>e :tabe ~/.vimrc<CR>
nnoremap <leader><leader><leader> :set list<CR>
nnoremap <leader><leader><leader><leader> :echo "leader:" mapleader<CR>

nnoremap #5 S" ··············································································<Esc>
