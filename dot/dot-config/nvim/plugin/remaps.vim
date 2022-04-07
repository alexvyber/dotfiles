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
" xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal








inoremap <C-c> <esc>
nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <leader>e :ALEDetail<cr> " Show errors on leader-e

" Save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Pasting over a selection shouldn't alter the clipboard - via https://stackoverflow.com/a/7797434
" xnoremap p pgvy

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
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
" Tab completion for asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" Ctrl-backspace deletes previous word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Next/Prev error bindings for Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <leader><leader><leader> :set list<CR>
" Vyber Custom
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nnoremap <leader>e :e ~/.config/nvim/init.vim<CR>
nnoremap <Esc><F1> :tabedit
nnoremap <F1> :tabp<CR>
imap     <F1> <Esc>:tabp<CR>
nnoremap <F2> :tabn<CR>
imap     <F2> <Esc>:tabn<CR>
nnoremap <Esc><F4> :tabc<CR>

" git remaps
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" PlenaryTestFile
nmap <leader>tt <Plug>PlenaryTestFile

" -- Open NerdTree
nmap <leader>n :call ToggleNERDTree()<CR>

" -- FZF
" -- -------------------------------------
" -- current file buffer search
nmap ]] :BLines!<CR>
" -- All files in current folder search
nmap ?? :Rg!<CR>
" -- Current folder files search
nmap <leader>p :Files!<CR>
" -- fzf-powered command search
map \\ :Commands!<CR>
let g:fzf_preview_window = ['right:60%', 'ctrl-/']


" -- LSP
" -- -------------------------------------
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>


" -- HARPOON
" -- -------------------------------------
nnoremap <silent><leader>a    :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent>     <C-e>   :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc   :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <silent>     <C-h>   :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent>     <C-t>   :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent>     <C-n>   :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent>     <C-s>   :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>tu   :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>te   :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cu   :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>ce   :lua require("harpoon.term").sendCommand(1, 2)<CR>


" -- TELESCOPE
" -- -------------------------------------
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>td :lua require('theprimeagen.telescope').dev()<CR>
