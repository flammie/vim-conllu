" Vim syntax file
" Language:     CONLL-U natural language annotations (TSV-like)
" Maintainer:   Flammie Pirinen <flammie@iki.fi>
" Last Change:  2019-02-18 01:08:40 +0100
" URL:  https://github.com/flammie/vim-conllu/
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'conllu'
endif

syn sync clear

syn case match

" Keywords
" Special comments
syn keyword     conlluCommentKeyWords   text sent_id translit text_en sent_id newdoc newpar id
" column 4 UPOS
syn keyword     conlluUposes    NOUN ADJ VERB AUX CCONJ SCONJ PART ADV ADP
\                               PUNCT INTJ PROPN DET NUM PRON X
" column 5 Ufeat = Uval
syn keyword     conlluUfeats    PronTyp NumType Poss Reflex Foreign Abbr
\                                Gender Animacy NounClass Number Case Definite
\                                Degree VerbForm Mood Tense Aspect Voice
\                                Evident Polarity Person Polite Clusivity
syn keyword     conlluUvalues   Art Dem Emp Exc Ind Int Neg Prs Rcp Rel Tot
\                                Card Ord Dist Mul Frac Range Sets Yes Com
\                                Fem Masc Neut Anim Hum Inan NHum Bantu
\                                Sing Plur Coll Count Dual Grpa Grpl Inv Pauc
\                                Ptan Tri Abs Acc Erg Nom Dat Abe Ben Cau Cmp
\                                Cns Com Dat Dis Equ Gen Ins Par Tem Tra Voc
\                                Abl Add Ade All Del Ela Ess Ill Ine Lat Loc
\                                Per Sub Sup Ter Com Cons Spec Ind Def Abs
\                                Cmp Equ Sup Pos Conv Fin Gdv Ger Inf Part Sup
\                                Vnoun Adm Cnd Imp Des Ind Jus Nec Opt Pot Prp
\                                Qot Sup Hab Imp Iter Perf Prog Prosp Act Antip
\                                Cau Dir Mid Inv Pass Rcp Fh Nfh Neg Pos
\                                0 1 2 3 4 Elev Form Humb Infm Ex In
" Column 8 Udep, 9 extdeps
syn keyword     conlluDepRel    nsubj obj iobj csub xcomp ccomp obl
\                                vocative exp dislocated advcl advmod
\                                discourse aux cop mark nmod appos nummod
\                                acl amod det clf case conj cc fixed flat
\                                compound list parataxis orphan goeswith
\                                reparandum punct root dep
" Column 1 index, 7 head, 9 extdeps
syn match       conlluIndex     /[0-9]+\([-.][0-9]+\)?/       contained display
" Column 10 misc
syn keyword     conlluMisc      SpaceAfter Translit LTranslit Gloss MSeg MGloss
syn match       conlluEmpty     /\w_\w/ contained display

" Comments
syn keyword     conlluCommentNotes      TODO FIXME XXX  contained
syn match       conlluComment   /^#.*/  contains=conlluCommentKeyWords,conlluCommentNotes

" Clusters, regions...

" Highlights
highlight def link      conlluEmpty     Constant
highlight def link      conlluUposes    Keyword
highlight def link      conlluUfeats    Identifier
highlight def link      conlluUvalues   String
highlight def link      conlluDepRel    Keyword
highlight def link      conlluIndex     Number
highlight def link      conlluCommentKeyWords   SpecialComment
highlight def link      conlluCommentNotes      Todo
highlight def link      conlluComment   Comment

let b:current_syntax = "conllu"

if main_syntax == 'conllu'
  unlet main_syntax
endif

" vim: ts=8
