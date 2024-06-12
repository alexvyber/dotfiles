

" TODO decide wheather I need it or not
" CtrlSF searc and edit file in-place with Edit Mode
" https://github.com/dyng/ctrlsf.vim
" ---------------------------------------
" Set "<leader>s" to substitute the word under the cursor. Works great with
" CtrlSF!

" TODO decide to use or not
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

" if &term =~ "xterm"
"   " normal mode caret: solid vertical block
"   let &t_SI .= "\<Esc>[6 q"
"   " insert mode caret: solid vertical var
"   let &t_EI .= "\<Esc>[2 q"
" endif
