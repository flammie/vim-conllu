" Author: Flammie <flammie@iki.fi>
" Description: validate conllu files

call ale#Set('conllu_validate_executable', 'conllu_validate.py')
call ale#Set('conllu_validate_options', '--lang en')

function! ale_linters#conllu#validate#MakeCommand(buffer)
    let l:command = ale#Var(a:buffer, 'conllu_validate_executable') .
                \ ' ' . ale#Var(a:buffer, 'conllu_validate_options') .
                \ ' %t'
    return l:command
endfunction

function! ale_linters#conllu#validate#Handle(buffer, lines) abort
    let l:output = []
    let l:pattern = '\v\[Line (\d+) (.+)\]: (.*)'

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'text': l:match[3],
        \   'type': 'E',
        \})
    endfor

    let l:pattern = '\v\[Tree number (\d+) on line (\d+) Sent (.+)\]: (.*)'

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[2] + 0,
        \   'text': l:match[4],
        \   'type': 'E',
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('conllu', {
\   'name': 'conllu_validate',
\   'executable': {b -> ale#Var(b, 'conllu_validate_executable')},
\   'output_stream': 'stderr',
\   'command': function('ale_linters#conllu#validate#MakeCommand'),
\   'callback': 'ale_linters#conllu#validate#Handle',
\   'lint_file': 1,
\})
