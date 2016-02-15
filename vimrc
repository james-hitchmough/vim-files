set title
:colorscheme gruvbox
set t_Co=256
set background=dark
"set tw=72

" main indent setting for <tab>
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" source abbreviations file
source /home/james/.vim/custom_abbr.vim

" shortcut to abbreviations file
nnoremap <leader>abb :vsplit ~/.vim/custom_abbr.vim<cr>

" automatically cd to location of current file
set autochdir

" Strip trailing whitespace on write
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Maps <;> to : for ease of command entry
nnoremap ; :

" Set the <leader> key to the spacebar
let mapleader = "\<Space>"

" Shortcut for 'toggle fold'
nnoremap <leader><leader> zA

" Fixes <j> and <k> key behaviour with 'screen lines'
nnoremap j gj
nnoremap k gk

nnoremap <leader>rel :set relativenumber

" vim-airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

"Soft-wrapping settings
:set nolist wrap linebreak breakat&vim

" DEFAULT GUI FONT
set guifont=Anonymous\ Pro\ 12

"Mutt email client settings
au BufRead /tmp/mutt-* set tw=72

" pathogen plugin manager config
execute pathogen#infect()
syntax on
filetype plugin indent on
set sessionoptions-=options

" Solves markdown folding issues
let g:vim_markdown_folding_disabled=1

"NERDTree plugin shortcut
nnoremap <leader>nt :NERDTree

" Map <j><j> to <ESC> for switching to 'normal' mode
inoremap jj <ESC>

"Clear the search buffer when hitting Ctrl-h
:nnoremap <C-h> :nohlsearch<cr>

set number
"set relativenumber
set undofile
set showcmd
set ttyfast
set incsearch
set showmatch
set hlsearch

""  GUI OPTIONS TOGGLING
function! ToggleGUI()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <leader>gui :call ToggleGUI()<cr>

" by default, hide gui menus
set guioptions=i

" QUICK BUILD FOR LATEX
nmap <F2> :!pdflatex *.tex<cr><cr>
nmap <F3> :!evince *.pdf && disown &<cr><cr>

" QUICK BUILD FOR PANDOC .md > .pdf
"nmap <F4> :!pandoc -V papersize:"a4paper" *.md -o *.pdf<cr><cr>
nmap <F4> :!mkpdf<cr><cr>
nmap <F5> :!zathura *.pdf && disown &<cr><cr>
nmap <F6> :!pandoc -V papersize:"a4paper" --latex-engine=pdflatex *.md -o *.pdf<cr><cr>

" QUICK BUILD FOR PANDOC .md > .html (with LaTeX)
nmap <F7> :!pandoc *.md -s --mathml -o *.html<cr><cr>
nmap <F8> :!firefox *.html && disown &<cr><cr>

" QUICK BUILD FOR PANDOC .md > .pdf (for mobile)
nmap <F9> :!pandoc -V papersize:"a6paper" *.md -o mobile.pdf --template ~/Dropbox/NOTEBOOK/Other/mobtemp.latex<cr><cr>


"Shortcut for markdown strikethrough
let @s = '(wi~~$a~~'

" Copy, Paste and System Paste
map <Leader>ps "+gP
map <Leader>p "+p
map <Leader>y "+y

" Colorscheme selections
nnoremap <leader>m :colorscheme molokai
nnoremap <leader>de :colorscheme desert
nnoremap <leader>sol :colorscheme solarized
nnoremap <leader>ma :colorscheme material
nnoremap <leader>g :colorscheme gruvbox
nnoremap <leader>d :colorscheme darkslategray
nnoremap <leader>mi :colorscheme midnight
nnoremap <leader>pc :colorscheme PaperColor
nnoremap <leader>a :colorscheme alduin

" Font selections
nnoremap <leader>gfa :set guifont=Anonymous\ Pro\ 12
nnoremap <leader>gfh :set guifont=Hack\ Regular\ 11
nnoremap <leader>gff :set guifont=Fantasque\ Sans\ Mono\ Regular\ 12

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>r <C-w>r
nnoremap <leader>, <C-w><C-w>

" .vimrc editing/sourcing
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Disables Arrow Key Navigation (req'd off for mouse scrolling)
" (normal mode)
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

" Disables arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> gk
nnoremap <down> gj

" Autosaves folds on exit and autoloads folds on start
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" EOF
