" Vim syntax file
" Language:    JavaScript
" Maintainer:  Claudio Fleiner <claudio@fleiner.com>
" Updaters:    Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:         http://www.fleiner.com/vim/syntax/javascript.vim
" Changes:     (ss) added keywords, reserved words, and other identifiers
"              (ss) repaired several quoting and grouping glitches
"              (ss) fixed regex parsing issue with multiple qualifiers [gi]
"              (ss) additional factoring of keywords, globals, and members
" Last Change: 2019 Sep 27
"              2013 Jun 12: adjusted javaScriptRegexpString (Kevin Locke)
"              2018 Apr 14: adjusted javaScriptRegexpString (LongJohnCoder)
"              2020 May 5; added custom highlighting (Ty Levad)

" tuning parameters:
" unlet javaScript_fold

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptSpecial          "\\\d\d\d\|\\."
syn match   javaScriptSpecialOperator  "->\|\.\|\,\|\;\|\:\|?\|!"
syn match   javaScriptSymbol           "[a-zA-Z0-9_-]\+:"
syn match   javaScriptOperator         "\.\.\.\|=>\|&&\|&&=\|||\|||=\||\||="
syn match   javaScriptOperator         "=\|+\+\|+=\|-\+\|-=\|\*\+\|\*\+=\|%\+\|%=\|/\|/=\|\~\+"
syn match   javaScriptOperator         "<\|<=\|=>\|>\|==\+\|!=\+"
syn region  javaScriptBracketOperator  matchgroup=javaScriptOperator start="\%(\w[?!]\=\|[]})]\)\@<=\[\s*" end="\s*]" contains=ALLBUT

syn region javaScriptStringD matchgroup=javaScriptStringDelim start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=javaScriptSpecial,@htmlPreproc
syn region javaScriptStringS matchgroup=javaScriptStringDelim start=+'+ skip=+\\\\\|\\'+ end=+'\|$+ contains=javaScriptSpecial,@htmlPreproc
syn region javaScriptStringT matchgroup=javaScriptStringDelim start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=javaScriptSpecial,javaScriptEmbed,@htmlPreproc
syn region  javaScriptEmbed  matchgroup=javaScriptEmbedDelim start=+${+ end=+}+ contains=@javaScriptEmbededExpr keepend

syn keyword javaScriptCommentTodo TODO FIXME XXX TBD NOTE contained
syn match   javaScriptLineComment "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment     start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo

syn match   javaScriptNumber  "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   javaScriptInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>" display
syn match   javaScriptInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>" display
syn match   javaScriptInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>" display
syn match   javaScriptInteger "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>" display
" FIXME 0.04 has red decimal
syn match   javaScriptFloat   "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>" display
syn match   javaScriptFloat   "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>" display

syn region javaScriptRegexpString start=+[,(=+]\s*/[^/*]+ms=e-1,me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[+;.,)\]}]+me=e-1 end=+/[gimuys]\{0,2\}\s\+\/+me=e-1 contains=@htmlPreproc,javaScriptComment oneline

syn keyword javaScriptConditional if else switch
syn keyword javaScriptRepeat      while for do in of from
syn keyword javaScriptBranch      break continue
syn keyword javaScriptClassOp     new delete instanceof typeof
syn match   javaScriptType        "\%(\%([.@$]\@<!\.\)\@<!\<\)\_s*\zs\u\w*\%(\>\)\@="
syn match   javaScriptConstant    "\%(\%([.@$]\@<!\.\)\@<!\<\)\_s*\zs[A-Z0-9_-]*\%(\>\)\@="
syn match   javaScriptNumber      "-\?Infinity"
syn keyword javaScriptStatement   return with await
syn keyword javaScriptBoolean     true false
syn keyword javaScriptNull        null undefined
syn keyword javaScriptIdentifier  arguments this var let
syn keyword javaScriptLabel       case default
syn keyword javaScriptException   try catch finally throw
syn keyword javaScriptMessage     alert confirm prompt status
" syn keyword javaScriptGlobal      self window top parent
syn keyword javaScriptGlobal      self window parent
syn keyword javaScriptMember      document event location
syn keyword javaScriptDeprecated  escape unescape
syn keyword javaScriptReserved    abstract boolean byte char class const debugger double enum export
syn keyword javaScriptReserved    extends final float goto implements import int interface long native
syn keyword javaScriptReserved    package private protected public short static super synchronized
syn keyword javaScriptReserved    throws transient volatile async

syn match javaScriptImport "\%(^import\s\+\)\@<=\w\+"

syn cluster javaScriptEmbededExpr contains=ALLBUT,javaScriptBoolean,javaScriptNull,javaScriptIdentifier,javaScriptStringD,javaScriptStringS,javaScriptStringT

if exists("javaScript_fold")
    syn match  javaScriptFunction     "\<function\>"
    syn region javaScriptFunctionFold start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword javaScriptFunction     function
    syn region  javaScriptArrayLiteral matchgroup=javaScriptArrayDelimiter start="\%(\w\|[\]})]\)\@<!\[" end="]" contains=ALLBUT
    syn match   javaScriptBraces       "[{}]"
    syn match   javaScriptParens       "[()]"
endif

syn region javaScriptArrowArg matchgroup=javaScriptArrowDelim start="\%(\w\|\]\)\@<!(" end=")\s*\%(=>\)\@=" oneline display contains=ALL keepend
" FIXME - if (!(stuff > things)) {... if (stuff() && things()) {...
syn region javaScriptFuncArg  matchgroup=javaScriptFuncDelim start="\%(\%(if\|for\)\s\+\)\@<!(" end=")\s*\%({\)\@=" oneline display contains=ALL keepend

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link javaScriptComment           Comment
hi def link javaScriptLineComment       Comment
hi def link javaScriptCommentTodo       Todo
hi def link javaScriptSpecial           Special
hi def link javaScriptSymbol            Special
hi def link javaScriptSpecialOperator   Special
hi def link javaScriptStringS           String
hi def link javaScriptStringD           String
hi def link javaScriptStringT           String
hi def link javaScriptStringDelim       Special
hi def link javaScriptCharacter         Character
hi def link javaScriptSpecialCharacter  javaScriptSpecial
hi def link javaScriptNumber            Number
hi def link javaScriptInteger           Number
hi def link javaScriptFloat             Number
hi def link javaScriptRepeat            Repeat
hi def link javaScriptConditional       Conditional
hi def link javaScriptBranch            Conditional
hi def link javaScriptClassOp           Conditional
hi def link javaScriptOperator          Operator
hi def link javaScriptType              Type
hi def link javaScriptStatement         Statement
hi def link javaScriptFunction          Function
hi def link javaScriptBraces            Function
hi def link javaScriptArrayDelimiter    Function
hi def link javaScriptError             Error
hi def link javaScrParenError           javaScriptError
hi def link javaScriptNull              Number
hi def link javaScriptBoolean           Boolean
hi def link javaScriptRegexpString      String
hi def link javaScriptArrowArg          javaScriptArg
hi def link javaScriptFuncArg           javaScriptArg
hi def link javaScriptArg               Identifier
hi def link javaScriptArrowOp           Operator
hi def link javaScriptIdentifier        Identifier
hi def link javaScriptConstant          Function
hi def link javaScriptImport            Function
hi def link javaScriptLabel             Label
hi def link javaScriptException         Exception
hi def link javaScriptMessage           Label
hi def link javaScriptGlobal            Keyword
hi def link javaScriptMember            Keyword
hi def link javaScriptDeprecated        Exception
hi def link javaScriptReserved          Keyword
hi def link javaScriptDebug             Debug
hi def link javaScriptEmbedDelim        Delimiter

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=2
