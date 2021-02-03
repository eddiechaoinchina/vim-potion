" @brief   : set potion file's folding method to expr using
"            function GetPotionFold(), it folds according to
"            indent level, but includes the line before so 
"            it becomes more natural
" @path    : ~/.vim/bundle/vim-potion/ftplugin/potion/folding.vim
"            (or ~\vimfiles\bundle\... on Windows)
" @author  : will
" @date    : 2021-02-01
" @modify  : 2021-02-03

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" @brief Given by the manual to get the current script id. The
"        purpose is to set foldexpr to a script-local function,
"        but <sid> can only be used in mappings or commands,
"        which make this function useful, for it could be joined
"        in 'exe'. After being called, it should be deleted with
"        'delf' cause it will be useless then.
"
" @retur Set s:SID variable.
"
fu! <sid>DetermineSID()
    let s:SID = matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_DetermineSID$')
endfu
call s:DetermineSID()
delf s:DetermineSID


setl foldmethod=expr
exe 'setl foldexpr=<snr>' . s:SID . '_GetPotionFold(v:lnum)'


" @brief next non-blank line
"
" @param line number
"
" @retur number of next non-blank 
"        line
fu! <sid>NextNonBlankLine(lnum)
	let numlines = line('$')
	let current = a:lnum + 1

	while current <= numlines
		if getline(current) =~# '\S'
			return current
		endif

		let current += 1
	endwhile

	return -2
endfu


" @brief calculate indent level using 
"        indent divided by shiftwidth,
"        undefined line will return 0
"
" @param line number
"
" @retur indent level
"
fu! <sid>IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfu


" @brief compare current line's indent level 
"        with next non-blank line's.
"        when this's >= next's, set to this
"        otherwise, set to '>' . next's
"
" @param line number
"
" @retur fold level of given line
"
fu! <sid>GetPotionFold(lnum)
	if getline(a:lnum) =~# '^\s*$'
		return '-1'
	endif

	let this_indent = <sid>IndentLevel(a:lnum)
	let next_indent = <sid>IndentLevel(<sid>NextNonBlankLine(a:lnum))

	if this_indent == next_indent
		return this_indent
	elseif this_indent > next_indent
		return this_indent
	elseif this_indent < next_indent
		return '>' . next_indent
	endif
endfu
