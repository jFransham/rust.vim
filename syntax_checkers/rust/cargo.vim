" Vim syntastic plugin
" Language:     Rust
" Maintainer:   Jack Fransham
"
" See for details on how to add an external Syntastic checker:
" https://github.com/scrooloose/syntastic/wiki/Syntax-Checker-Guide#external

if exists("g:loaded_syntastic_rust_cargo_checker")
	finish
endif
" let g:cargo_makeprg_params = "rustc -- -Zno-trans"
let g:loaded_syntastic_rust_cargo_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_rust_cargo_GetLocList() dict
	let makeprg = self.makeprgBuild({
				\ 'fname': 'rustc',
				\ 'post_args': ['--', '-Z', 'no-trans'] })

	let errorformat  =
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
	\ 'name': 'cargo',
	\ 'exec': 'cargo'})

let &cpo = s:save_cpo
unlet s:save_cpo
