"============================================================================
"File:        conllu.vim
"Description: CONLL-U syntax checking plugin for syntastic
"Maintainer:  Flammie <flammie@iki.fi>
"License:     GPL-3, not any later versions
"============================================================================

"
if exists('g:loaded_syntastic_conllu_validate_checker')
    finish
endif
let g:loaded_syntastic_conllu_validate_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_conllu_validate_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_conllu_validate_GetLocList() dict
    let makeprg = self.makeprgBuild({'args': '--lang eng'})
    let errorformat = '%-G%\%.%\%.%\%.%.%#,'
    let errorformat .= '[Line %l Sent %.%#]: %m,'
    let errorformat .= '[Tree number %.%# on line %l Sent %.%#]: %m,'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat})
endfunction
    

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'conllu',
    \ 'name': 'validate',
    \ 'exec': 'conllu_validate.py'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
