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
go to https://github.com/universaldependencies/tools and get the `validate.py`,
and copy it to `$PATH` as `conllu_validate.py`.

**NB:** the --lang en is hard-coded... not sure there's any easy way around it.

### Syntastic

There's a syntastic script that gets registered as conllu/validate, you have to
add it to syntastic registry to enable automatic checking on write manually.

### ALE

There's an ALE script that seems to just work automatically. ALE is better than
syntastic, so use that.
