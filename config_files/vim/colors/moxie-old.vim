" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:  Ty Levad - tylevad@gmail.com
" Last Change: 2017-07-08
"
" ir_black color scheme used as structural template - http://blog.infinitered.com
"
" **************************************
"*background: #121212
"*foreground: #a0a0a0
"! black
"*color0: #070707
"*color8: #252525
"! red
"*color1: #9f2562
"*color9: #b52a70
"! green
"*color2: #629f25
"*color10: #70b52a
"! yellow
"*color3: #9f6225
"*color11: #b5702a
"! blue
"*color4: #25629f
"*color12: #2a70b5
"! magenta
"*color5: #62259f
"*color13: #702ab5
"! cyan
"*color6: #259f62
"*color14: #2ab570
"! white
"*color7: #8a8a8a
"*color15: #a0a0a0
" **************************************

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "moxie"

"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE      ctermbg=NONE        cterm=NONE

" General colors
hi Normal          guifg=#a0a0a0     guibg=#121212   gui=NONE      ctermfg=NONE      ctermbg=NONE      cterm=NONE
hi NonText         guifg=#585858     guibg=NONE      gui=BOLD      ctermfg=240       ctermbg=NONE      cterm=BOLD

hi Cursor          guifg=NONE        guibg=NONE      gui=REVERSE   ctermfg=NONE      ctermbg=NONE     cterm=REVERSE
hi LineNr          guifg=#585858     guibg=NONE      gui=NONE      ctermfg=240       ctermbg=NONE      cterm=NONE
hi ColorColumn     guifg=NONE        guibg=#1c1c1c   gui=NONE      ctermfg=NONE      ctermbg=234       cterm=NONE

hi VertSplit       guifg=#3a3a3a     guibg=#404040   gui=NONE      ctermfg=237       ctermbg=NONE      cterm=NONE
hi StatusLine      guifg=#8a8a8a     guibg=NONE      gui=ITALIC    ctermfg=245       ctermbg=NONE      cterm=NONE
hi StatusLineNC    guifg=#8a8a8a     guibg=#262626   gui=NONE      ctermfg=245       ctermbg=235       cterm=NONE

hi Folded          guifg=#121212     guibg=#25629f   gui=NONE      ctermfg=233       ctermbg=blue      cterm=NONE
hi Title           guifg=#a0a0a0     guibg=NONE      gui=bold      ctermfg=NONE      ctermbg=NONE      cterm=NONE
hi Visual          guifg=NONE        guibg=#3a3a3a   gui=NONE      ctermfg=NONE      ctermbg=237       cterm=NONE

hi SpecialKey      guifg=#585858     guibg=NONE      gui=NONE      ctermfg=240       ctermbg=NONE      cterm=NONE

hi WildMenu        guifg=#121212     guibg=#9f6225   gui=NONE      ctermfg=233       ctermbg=yellow    cterm=NONE
hi PmenuSbar       guifg=#121212     guibg=#a0a0a0   gui=NONE      ctermfg=233       ctermbg=white     cterm=NONE
"hi Ignore          guifg=gray        guibg=black     gui=NONE      ctermfg=NONE      ctermbg=NONE      cterm=NONE

hi Error           guifg=NONE        guibg=NONE      gui=UNDERCURL ctermfg=233       ctermbg=red       cterm=NONE     guisp=#9f2562 " undercurl color
hi ErrorMsg        guifg=#121212     guibg=#9f2562   gui=BOLD      ctermfg=233       ctermbg=red       cterm=NONE
hi WarningMsg      guifg=#121212     guibg=#9f2562   gui=BOLD      ctermfg=233       ctermbg=red       cterm=NONE
hi LongLineWarning guifg=NONE        guibg=NONE      gui=UNDERLINE ctermfg=NONE      ctermbg=NONE	     cterm=UNDERLINE

" Tabs
hi TabLineFill     guifg=#a0a0a0     guibg=#121212   gui=NONE      ctermfg=white     ctermbg=233
hi TabLine         guifg=#a0a0a0     guibg=#3a3a3a   gui=NONE      ctermfg=white     ctermbg=237
hi TabLineSel      guifg=#262626     guibg=#8a8a8a   gui=NONE      ctermfg=235       ctermbg=245

" Message displayed in lower left, such as --INSERT--
hi ModeMsg         guifg=#629f25     guibg=NONE      gui=NONE      ctermfg=green     ctermbg=NONE      cterm=NONE

" Vim 7.x specific colors
hi CursorLine      guifg=NONE        guibg=#262626   gui=NONE      ctermfg=NONE      ctermbg=235       cterm=NONE
hi CursorColumn    guifg=NONE        guibg=#262626   gui=NONE      ctermfg=NONE      ctermbg=235       cterm=NONE
hi MatchParen      guifg=#121212     guibg=#9f2562   gui=NONE      ctermfg=233       ctermbg=red       cterm=NONE
hi Pmenu           guifg=#8a8a8a     guibg=#262626   gui=NONE      ctermfg=245       ctermbg=235       cterm=NONE
hi PmenuSel        guifg=#629f25     guibg=#3a3a3a   gui=NONE      ctermfg=green     ctermbg=237       cterm=NONE
hi Search          guifg=NONE        guibg=NONE      gui=REVERSE   ctermfg=NONE      ctermbg=NONE      cterm=REVERSE

" Syntax highlighting
hi Comment         guifg=#585858     guibg=NONE      gui=NONE      ctermfg=240       ctermbg=NONE      cterm=NONE
hi String          guifg=#25629f     guibg=#262626   gui=NONE      ctermfg=blue      ctermbg=235       cterm=NONE
hi Number          guifg=#62259f     guibg=NONE      gui=NONE      ctermfg=magenta   ctermbg=NONE      cterm=NONE

hi Keyword         guifg=#9f6225     guibg=NONE      gui=NONE      ctermfg=yellow    ctermbg=NONE      cterm=NONE
hi PreProc         guifg=#629f25     guibg=NONE      gui=NONE      ctermfg=green   ctermbg=NONE      cterm=NONE
hi Conditional     guifg=#629f25     guibg=NONE      gui=NONE      ctermfg=green     ctermbg=NONE      cterm=NONE  " if else end

hi Todo            guifg=#121212     guibg=#9f6225   gui=NONE      ctermfg=233       ctermbg=yellow    cterm=NONE
hi Constant        guifg=#9f2562     guibg=NONE      gui=NONE      ctermfg=red       ctermbg=NONE      cterm=NONE

hi Identifier      guifg=#9f6225     guibg=NONE      gui=NONE      ctermfg=yellow    ctermbg=NONE      cterm=NONE
hi Function        guifg=#25629f     guibg=NONE      gui=NONE      ctermfg=blue      ctermbg=NONE      cterm=NONE
hi Type            guifg=#62259f     guibg=NONE      gui=NONE      ctermfg=magenta   ctermbg=NONE      cterm=NONE
hi Statement       guifg=#629f25     guibg=NONE      gui=NONE      ctermfg=green     ctermbg=NONE      cterm=NONE

hi Special         guifg=#9f2562     guibg=NONE      gui=NONE      ctermfg=red       ctermbg=NONE      cterm=NONE
hi Delimiter       guifg=#62259f     guibg=NONE      gui=NONE      ctermfg=magenta   ctermbg=NONE      cterm=NONE
hi Operator        guifg=#629f25     guibg=NONE      gui=NONE      ctermfg=green     ctermbg=NONE      cterm=NONE

hi link Character       Number
hi link Boolean         String
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Keyword
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
hi link htmlLink        ModeMsg
