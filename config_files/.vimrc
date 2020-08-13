" Ty Levad - tylevad@gmail.com
" .vimrc

call plug#begin('~/.vim/bundle')
" fuzzy file opener
Plug 'junegunn/fzf'
" distraction free, centered view
Plug 'junegunn/goyo.vim'
" everything must be perfict...
Plug 'junegunn/vim-easy-align'
" updgraded statusline
Plug 'vim-airline/vim-airline'
" git info in airline
Plug 'tpope/vim-fugitive'
" simple comment/uncomment capable of handling blocks
Plug 'tpope/vim-commentary'
" . repetition support for a few plugins (commentary)
Plug 'tpope/vim-repeat'
" automatic control structure closure
Plug 'tpope/vim-endwise'
" quick shortcuts for expanded cursor motion
Plug 'easymotion/vim-easymotion'
" bracket/parentheses/quote/etc auto-close
Plug 'raimondi/delimitmate'
" hex color code colorizer
Plug 'lilydjwg/colorizer'
" rg in vim
Plug 'jremmen/vim-ripgrep'
call plug#end()

" Basic settings
set hidden
set number
set scrolloff=10
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" map <Leader> to <Space> (it's better this way, trust me...)
"  also, this has to be done before using it anywhere, as *current*
"    leader is used at time of key mapping
let mapleader = "\<Space>"
" reload config (I end up doing this a lot...)
nnoremap <Leader>v :source ~/.vimrc<CR>

" swap - let's not leave these all over the place...
set dir=~/.vim/tmp

" ignore files (also used by CtrlP)
set wildignore+=*/Library/*,*/Pictures/*,*/Music/*,*.log,*.png,*.jpg,*.gif,*.pdf

" Colors and appearance
set colorcolumn=100
set background=dark
colorscheme moxie
syntax sync minlines=100
syntax enable

" indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set backspace=indent,start

" list is off by default
set listchars=tab:»⎵,space:· "",eol:⏎
" toggle list
nnoremap <Leader>; :set list!<CR>

" Search options
set wrapscan
set hlsearch
set incsearch
" clear search
nnoremap <Leader>c :noh<CR>

" ripgrep search word under cursor
nnoremap <Leader>rg :Rg<CR>
let g:rg_highlight = 'true'
let g:rg_derive_root = 'true'

" I hate my non-physical escape key...
inoremap jj <Esc>`^
vnoremap ` <Esc>

" buffer shortcuts
nnoremap H :bp<CR>
nnoremap L :bn<CR>
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bd :bd<CR>

" split navigation
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>

" custom quit with session saving per working directory
" don't forget to create ~/.vim/tmp
let g:session_dir = substitute(getcwd(), '/', '.', 'g')
let g:session_file = '~/.vim/tmp/' . g:session_dir . '.vim'
" custom quit and write with session save
exec 'nnoremap <Leader>qq :mks! ' . g:session_file . '<CR>:q<CR>'
exec 'nnoremap <Leader>ww :mks! ' . g:session_file . '<CR>:w<CR>'
" open previously saved session
exec 'nnoremap <Leader>ss :source ' . g:session_file . '<CR>'

" other similar custom save and/or quit commands
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>qa :q!<CR>

" replace line navigation with column navigation (no jumping when wrapped)
nnoremap j gj
nnoremap k gk

" automatically set a mark before some common mode/motion commands for easy return
"  (i.e. :125 <change stuff> gb and you're right back where you started!)
nnoremap : mz:
nnoremap / mz/
" unfortunately, this breaks <count>G, which will take you to line number
"   <count>... so, uhh, just use :<count>, which will do the same thing?
"   (and also sets the auto-mark!)
nnoremap G mzG
nnoremap gg mzgg
" return to auto-mark
nnoremap gb `z
" toggle position
nnoremap gt ``

" increment number
nnoremap tk <C-a>
" decrement number
nnoremap tj <C-x>

" simpler redo
nnoremap U <C-R>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Goyo (distraction free mode)
nnoremap <Leader>go :Goyo<CR>
let g:goyo_width  = 100
let g:goyo_height = 95
let g:goyo_linenr = 1

" FZF
nnoremap <Leader>o :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" vim-airline
let g:airline_theme                            = 'moxie'
let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod      = ':t'

" colorizer doesn't work well with really large files, but it doesn't need to
let g:colorizer_maxlines = 5000
