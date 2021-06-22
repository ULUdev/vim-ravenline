" Name: raven-line
" Author: Moritz Sokoll
" Description: a customizable statusline that is powerline like per default


function! Ravenline_mode()
	let m = mode(1)
	let retval = ''
	if matchstr(m, 'i') ==# 'i'
		let retval = 'insert'
	elseif matchstr(m, 'n') ==# 'n'
		let retval = 'normal'
	elseif matchstr(tolower(m), 'r') ==# 'r'
		let retval = 'replace'
	elseif matchstr(tolower(m), 'v') ==# 'v'
		let retval = 'visual'
	elseif matchstr(m, 'c') ==# 'c'
		let retval = 'command'
	elseif m == "\<C-V>"
		let retval = 'visual'
	elseif matchstr(m, 't') ==# 't'
		let retval = 'terminal'
	else
		let retval = 'normal'
	endif
	let retval = retval . ' '
	return retval
endfunction

function! Ravenline_git_branch()
	let branch = system("git branch --no-color | grep -i '^\\*.*$' | sed 's/^\* //' | tr \"\\n\" \" \" | sed 's/ $//'")
	let branchstr = ''
	if branch[0:5] == 'fatal:'
		let branchstr = 'no git repo '
	else
		let branchstr = ' ' . branch . ' '
	endif
	return branchstr
endfunction



set statusline=
set statusline+=%#RavenlineStatus#
set statusline+=\ %{toupper(Ravenline_mode())}
set statusline+=%#RavenlineTrans1#
if exists('g:ravenline_powerline')
	set statusline+=
endif
set statusline+=%#RavenlineGeneral#
set statusline+=\ %f
set statusline+=\ %h
set statusline+=
set statusline+=%#RavenlineModified#
set statusline+=\ %{&modified?'[+]':''}
set statusline+=%#RavenlineTrans3#
if exists('g:ravenline_powerline')
	set statusline+=
end
set statusline+=%#RavenlineNone#
set statusline+=%=
set statusline+=%#RavenlineTrans4#
if exists('g:ravenline_powerline')
	set statusline+=
end
set statusline+=%#RavenlineGeneral#
set statusline+=\ %Y\  
set statusline+=%#RavenlineTrans5#
if exists('g:ravenline_powerline')
	set statusline+=
end
set statusline+=%#RavenlineGit#
set statusline+=\ %l/%L
set statusline+=\ 
set statusline+=\  
