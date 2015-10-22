" Vim syntastic plugin
" Language:     Rust
" Maintainer:   Jack Fransham
"
" See for details on how to add an external Syntastic checker:
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide#external

if exists("g:loaded_syntastic_rust_clippy_checker")
	finish
endif
let g:loaded_syntastic_rust_clippy_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_rust_clippy_IsAvailable() dict
	return executable(self.getExec())
endfunction

function! SyntaxCheckers_rust_clippy_GetLocList() dict
	let makeprg = self.makeprgBuild({})

	let errorformat =
		\ '%E%f:%l:%c: %\d%#:%\d%# %.%\{-}error:%.%\{-} %m,'   .
		\ '%W%f:%l:%c: %\d%#:%\d%# %.%\{-}warning:%.%\{-} %m,' .
		\ '%C%f:%l %m,' .
		\ '%-Z%.%#'

	return SyntasticMake({
		\ 'makeprg': makeprg,
		\ 'cwd': expand('%:p:h'),
		\ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
	\ 'filetype': 'rust',
	\ 'name': 'clippy',
	\ 'exec': 'cargo-clippy'})

let &cpo = s:save_cpo
unlet s:save_cpo
