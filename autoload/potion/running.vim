" @brief   : autoload two functions needed for mappings
" @path    : ~/.vim/bundle/vim-potion/autoload/potion/running.vim
"            (or ~\vimfiles\bundle\... on Windows)
" @author  : steve losh
" @date    : unknown
" @modify  : 2021-02-03

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

echom "Autoloading..."

fu! potion#running#PotionCompileAndRunFile()
    silent !clear
    exe "!" . g:potion_command . " " . bufname("%")
endfu

fu! potion#running#PotionShowBytecode()
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " Open a new split and set it up.
    vsp __Potion_Bytecode__
    norm! ggdG
    setl filetype=potionbytecode
    setl buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfu
