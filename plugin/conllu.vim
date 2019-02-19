if exists('g:syntastic_extra_filetypes')
    call add(g:syntastic_extra_filetypes, 'conllu')
else
    let g:syntastic_extra_filetypes = ['conllu']
endif
