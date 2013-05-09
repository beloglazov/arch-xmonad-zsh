" InsertChar.vim - Use <tab> (or another key) to quickly insert a single character.
"
" Maintainer: Peter Hodge < toomuchphp-vim at yahoo dot com >
" Version: 1.0
"
" Installation:
" 	Step 1:
" 	Place this file in the ~/.vim/plugin/ folder.
"
" 	Step 2:
" 	Set up a mapping in .vimrc for your preferred key (I like <tab>)
"
" 	~/.vimrc:
"			nnoremap <TAB> :<C-U>call InsertChar#insert(v:count1)<CR>
"					-- OR --
"			nnoremap <SPACE> :<C-U>call InsertChar#insert(v:count1)<CR>
"
"		etc.
"
"
" Instructions:
" 	Use <tab>z to insert the letter 'z'. Use <tab>abc to insert the letters
" 	'abc'. If you have installed the repeat plugin, last seen at:
"		   http://www.vim.org/scripts/script.php?script_id=2136
"		then pressing '.' will repeat the insert.

" requires vim 7 ...
if version < 700 || exists('loaded_InsertChar')
	finish
endif

let loaded_InsertChar = 1

function! InsertChar#insert(count) " {{{
	" need to save the user input quickly ...
	call inputsave()

	" how many characters to insert? reset for next time
	let l:count = a:count

	" if no count, nothing to do
	if ! l:count
		call inputrestore()
		return
	endif

	let l:inserted = ''

	" save the current ':match' command, and stop autocommands
	let l:old_match = matcharg(1)
	let l:old_eventignore = &eventignore
	set eventignore+=insertenter,insertleave

	try
		" insert the filler text and move back
		execute 'normal! i' . repeat('_', l:count) . "\<ESC>" . repeat('h', l:count - 1)

		for l:pos in range(l:count)
			" highlight the blank text
			execute 'match Error /\%#' . repeat('.', l:count - l:pos) . '/'
			redraw

			" do we have a char yet?
			let l:char = getchar(0)

			" if we don't, prompt for it
			if ! l:char
				redraw
				echohl MoreMsg
				echo 'Char ' . (l:pos + 1) . '/' . l:count . ': '
				echohl None
				let l:char = getchar()
				echo
			endif

			" if char was <ESC>, we need to undo everything and abort
			if l:char == 27
				" go back however many characters we have inserted, and delete the fillers
				execute 'normal! ' . repeat('h', l:pos) . repeat('x', l:count)
				return
			endif

			" insert a regular character ...
			" NOTE: how we don't use '!' after normal, this allows mappings to be used
			undojoin
			execute 'normal r' . nr2char(l:char)

			" add this change to the last changeset, so it is all undone at once

			" remember the characters which have been added
			let l:inserted .= nr2char(l:char)

			" if it wasn't a carriage return, then we need to move right
			if l:char != 13 && (l:count - l:pos) > 1
				execute 'normal! l'
			endif
		endfor

		" we have inserted the text - set up the repeat plugin to repeat the
		" inserted text
		silent! call repeat#set('i' . l:inserted . "\<ESC>", -1)
	finally
		" restore 'match'
		if type(l:old_match) == type([]) && strlen(l:old_match[0]) && strlen(l:old_match[1])
			execute 'match' l:old_match[0] '/' . l:old_match[1] . '/'
		else
			match
		endif

		" restore autocommands
		let &eventignore = l:old_eventignore

		call inputrestore()
	endtry
endfunction " }}}
