" @brief   : define mappings that move between sections in potion
"            files (files that end with '.pn')
" @path    : ~/.vim/bundle/vim-potion/ftplugin/potion/sections.vim
"            (or ~\vimfils\bundle\... on Windows)
" @author  : will
" @date    : 2021-02-02
" @modify  : 2021-02-03

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This part uses 'noremap' instead of 'nnoremap' to make
" sure it works in both normal mode and operator-pending
" mode.

noremap <script> <buffer> <silent> [[
        \ :call <sid>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> ]]
        \ :call <sid>NextSection(1, 1, 0)<cr>
noremap <script> <buffer> <silent> []
        \ :call <sid>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> ][
        \ :call <sid>NextSection(2, 1, 0)<cr>
vnoremap <script> <buffer> <silent> [[
        \ :<c-u>call <sid>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call <sid>NextSection(1, 1, 1)<cr>
vnoremap <script> <buffer> <silent> []
        \ :<c-u>call <sid>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> ][
        \ :<c-u>call <sid>NextSection(2, 1, 1)<cr>

" @brief go to the next section
"
" @param type 1: line starting with a non-white char
"                or beginning of file
"             2: line starting with a non-white char
"                and including a '=', ending with a ':'
"
" @param backwards 1: backward
"                  0: forward
"
" @param visual    1: visual mode
"                  0: normal mode
"
" @retur none
"
fu! <sid>NextSection(type, backwards, visual)
	if a:visual
		normal! gv
	endif

	if a:type == 1
		let pattern = '\(\n\n^\S\|\%^\)'
		let flags   = 'e'
	elseif a:type ==2
		let pattern = '^\S.*=.*:$'
		let flags   = ''
	endif

	if a:backwards
		let dir = '?'
	else
		let dir = '/'
	endif

	exe 'silent normal!' . dir . pattern . dir . flags . "\r"
endfu
