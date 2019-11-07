# vim-conllu

Some vim scripts for working with CONLL-U files, e.g. universal dependencies
treebanks. Works for version 2, as detailed in
https://universaldependencies.org/format.html

## Installation

Vundle should just work, add this to your plugins in `.vimrc`:

```vim
Plugin 'flammie/vim-conllu'
```

If you don't use Vundle, you can copy the files manually, e.g.:

```bash
cp plugin/conllu.vim ~/.vim/plugin/
cp syntax/conllu.vim ~/.vim/syntax/
mkdir -p ~/.vim/syntax_checkers/conllu
cp syntax_checkers/conllu/validate.vim ~/.vim/syntax_checkers/conllu/
mkdir -p ~/.vim/ale_linters/conllu
cp ale_linters/conllu/validate.vim ~/.vim/ale_linters/conllu/
```

## Plugin

The plugin is just there to register filetypes and `.conllu` extension and etc.

## Syntax highlighting

There's nothing really advanced here, I've just listed the known names and
values as keywords to be highlighted, so if I typo something it will be
unhighlighted. The syntax highlighter does *not* count columns or anything. It
also knows the special comment names and the format of index numbers also for
ellipses and multiwords.

## Syntax checking

Syntax checking is done with `conllu_validate.py`, to have it work you need to
go to https://github.com/universaldependencies/tools and get the `validate.py`.

### ALE

There's an [ALE](https://github.com/dense-analysis/ale) plugin for automatic syntax
checking. It uses validate.py only at the moment. You need to set the following
settings for it to work:

* `ale_conllu_validate_executable` needs to point to `validate.py`
* `ale_conllu_validate_options` needs to contain at least the lang option

E.g.:

```vim
let g:ale_conllu_validate_executable = $HOME . '/github/universaldependencies/tools/validate.py'
let g:ale_conllu_validate_options = '--lang olo'
```

### Syntastic

There's a [syntastic](https://github.com/vim-syntastic/syntastic) script that gets
registered as conllu/validate, you have to add it to syntastic registry to enable
automatic checking on write manually.

**NB:** the --lang en is hard-coded... not sure there's any easy way around it.
You need to copy `validate.py` into `$PATH` as `conllu_validate.py`. The syntastic
stuff has been replaced by ALE and is no longer developed.
