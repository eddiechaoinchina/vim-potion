" @brief   : 1 compile and run, open a terminal silently
"            2 show byte code when compiling in a split
" @path    : ~/.vim/bundle/vim-potion/ftplugin/potion/running.vim
"            (or ~\vimfiles\bundle\... on Windows)
" @author  : steve losh
" @date    : unknown
" @modify  : 2021-02-03

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r
            \ :call potion#running#PotionCompileAndRunFile()<cr>

nnoremap <buffer> <localleader>b
            \ :call potion#running#PotionShowBytecode()<cr>
