" Vim syntax file
" Language:		custom note taking notation
" Maintainer:	Ty Levad - tylevad@gmail.com
" Last Change:	2018-03-14

if exists("b:current_syntax")
  finish
endif

" define product data syntax
syn region noteNode start=+\[+ end=+\]+
syn region noteAttr start=+<+ end=+>+

" define the note syntax
syn match   noteComment   "#.*"
syn match   noteHilite    "\*.*"
syn match   noteCommand   "$.*" contains=noteEmail,noteNumber,noteDateTime
syn match   noteTag       "@\w\+"
syn region  noteHeader    start="\*" end="\*" oneline contains=nodeDateTime,nodeItalic,noteImportant,noteTag
syn region  noteString    start=+"+ end=+"+
syn region  noteHereDoc   start=/<<-\z(\w*\)/ end=/^\s*\z1$/ keepend
syn match   noteNumber    "\v<[0-9,.]+>"
syn match   noteDateTime  "\v<\d{1,4}([\-\:]\d{1,4})+(\.\d+)*>" display
syn region  noteDone      start="+" end="$" oneline
syn keyword noteKeyword   TODO FIXME NOTE
syn match   noteEmail     "\v[_=a-z\./+0-9-]+\@[a-z0-9._-]+\a{2}" display
syn region  noteHigh      start=+!+ end=+!+ oneline
syn region  noteMid       start=+%+ end=+%+ oneline
syn region  noteLow       start=+_+ end=+_+ oneline

" Ruby HereDoc
syn include @RB syntax/ruby.vim
syn region hereDocDashRB matchgroup=Statement start=+<<[-~.]*\z(RB\)+  end=+^\s*\z1+ contains=@RB
syn region hereDocDashRB matchgroup=Statement start=+#{+  end=+}+ oneline contains=@RB

" SQL HereDoc
syn include @SQL syntax/sql.vim
syn region hereDocDashSQL matchgroup=Statement start=+<<[-~.]*\z(SQL\)+  end=+^\s*\z1+ contains=@SQL

" assign default highlighting
hi def link noteEmail     Include
hi def link noteComment   Comment
hi def link noteCommand   PreProc
hi def link noteHeader    Function
hi def link noteHigh      Special
hi def link noteMid       Identifier
hi def link noteLow       Label
hi def link noteTag       Type
hi def link noteString    String
hi def link noteHereDoc   String
hi def link noteNumber    Number
hi def link noteDateTime  Type
hi def link noteDone      Comment
hi def link noteHilite    Label
hi def link noteKeyword   Todo
hi def link nodeOperators Operator

hi def link noteNode      Number
hi def link noteAttr      Identifier

let b:current_syntax = "note"

" vim: ts=4
