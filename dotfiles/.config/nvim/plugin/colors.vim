let g:colorscheme = "ayu"

fun! ColorMyPencils()
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:colorscheme])
    else
        colorscheme ayu
    endif
    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd
endfun

call ColorMyPencils()

