set title
:colorscheme gruvbox
set t_Co=256
set background=dark
set mouse=a
set scrolloff=2

" automatically cd to location of current file
set autochdir

"Soft-wrapping settings
:set nolist wrap linebreak breakat&vim

" abbreviations file
source ~/.vim/custom_abbr.vim

" markdown folding script
source ~/.vim/md-fold.vim

" macros file
source ~/.vim/macros.vim

" main indent setting for <tab>
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" shortcut to abbreviations file
nnoremap <leader>abb :vsplit ~/.vim/custom_abbr.vim<cr>

"autocmd BufEnter * silent! lcd %:p:h

" Strip trailing whitespace on write
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Maps <;> to : for ease of command entry
nnoremap ; :

" Set the <leader> key to the spacebar
let mapleader = "\<Space>"

" Mappings for folding
nnoremap <leader><leader> zA
nnoremap <leader>z za

" Mappings for Tabs
nnoremap <C-N> <Esc>:tabn<CR>
nnoremap <C-P> <Esc>:tabp<CR>
nnoremap <C-O> <Esc>:tabnew<CR>

" Fixes <j> and <k> key behaviour with 'screen lines'
nnoremap j gj
nnoremap k gk

nnoremap <leader>rel :set relativenumber

" vim-airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" DEFAULT GUI FONT
set guifont=Anonymous\ Pro\ 12

"Mutt email client settings
au BufRead /tmp/mutt-* set tw=72

" pathogen plugin manager config
execute pathogen#infect()
syntax on
filetype plugin indent on
set sessionoptions-=options

" Disables auto markdown folding (custom script used)
let g:vim_markdown_folding_disabled=1

" Map <j><j> to <ESC> for switching to 'normal' mode
inoremap jj <ESC>

"Clear the search buffer when hitting Ctrl-h
:nnoremap <C-h> :nohlsearch<cr>

set number
set relativenumber
set undofile
set showcmd
set ttyfast
set incsearch
set showmatch

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

" COMPILING FOR LATEX
nmap <F2> :!pdflatex %:r.tex<cr><cr>
nmap <F5> :!sh /home/james/Dropbox/Scripts/ds zathura %:r.pdf<cr><cr>

" COMPILING FOR PANDOC .md > .pdf
nmap <F3> :!sh /home/james/Dropbox/Scripts/mkpdf<cr><cr>

" COMPILING FOR PANDOC .md > .html (with LaTeX)
nmap <F4> :!sh /home/james/Dropbox/Scripts/mkhtml<cr><cr>
"nmap <F4> :!pandoc -s -S -c ~/Dropbox/Markdown-Resources/markdown-css-themes/markdown5.css --mathjax % -o %:r.html<cr><cr>
nmap <F6> :!sh /home/james/Dropbox/Scripts/ds ice-firefox %:r.html<cr><cr>

" Alternative PDF viewer
nmap <F8> :!sh /home/james/Dropbox/Scripts/ds evince %:r.pdf<cr><cr>

" System Copy and Paste
map <Leader>p "+gp
map <Leader>y "+y

" Colorscheme selections
nnoremap <leader>m :colorscheme molokai
nnoremap <leader>de :colorscheme desert
nnoremap <leader>sol :colorscheme solarized
nnoremap <leader>ma :colorscheme material
nnoremap <leader>g :colorscheme gruvbox
nnoremap <leader>pc :colorscheme PaperColor

" Font selections
nnoremap <leader>gfa :set guifont=Anonymous\ Pro\ 12
nnoremap <leader>gfh :set guifont=Hack\ Regular\ 11
nnoremap <leader>gff :set guifont=Fantasque\ Sans\ Mono\ Regular\ 12

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>r <C-w>r
nnoremap <leader>, <C-w><C-w>

" Scratchpad for random notes
nnoremap <leader>s :vsplit ~/Dropbox/SCRATCHPAD.md<cr>

" .vimrc editing/sourcing
nnoremap <leader>ve :vsplit ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

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
