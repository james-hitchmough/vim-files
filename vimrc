"###################
"##     VIMRC     ##
"###################

set title
set t_Co=256
set background=dark
set mouse=a
set scrolloff=2
set nocursorline
:colorscheme gruvbox

"Soft-wrapping settings
:set nolist wrap linebreak breakat&vim

" abbreviations file
source ~/.vim/custom_abbr.vim
" markdown folding script
source ~/.vim/md-fold.vim
" macros file
source ~/.vim/macros.vim

" automatically cd to location of current file
:autocmd BufRead,BufNewFile,BufWritePost,BufEnter * lcd %:p:h

" main indent setting for <tab>
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" shortcut to abbreviations file
nnoremap <leader>abb :vsplit ~/.vim/custom_abbr.vim<cr>

" Strip trailing whitespace on write
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" i3wm config file detection
augroup i3_ftdetect
  au!
  au BufRead,BufNewFile ~/.config/i3/config set ft=i3
augroup END

" Set the <leader> key to the spacebar
let mapleader = "\<Space>"

" Mappings for folding
nnoremap <leader><leader> za
nnoremap <leader>z zA

" Mappings for Tabs
nnoremap <C-N> <Esc>:tabn<CR>
nnoremap <C-P> <Esc>:tabp<CR>
nnoremap <C-O> <Esc>:tabnew<CR>

" Changes <j> and <k> key behaviour for 'screen lines'
nnoremap j gj
nnoremap k gk

" vim-airline settings
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='dark'

" DEFAULT GUI FONT
set guifont=Roboto\ Mono\ for\ Powerline\ 10

"Mutt email client settings
"au BufRead /tmp/mutt-* set tw=72
au BufRead /tmp/mutt-* set nolist wrap linebreak breakat&vim

" pathogen plugin manager config
execute pathogen#infect()
syntax on
filetype plugin indent on
set sessionoptions-=options

" Disables auto markdown folding (custom script used)
let g:vim_markdown_folding_disabled=1

" Markdown LaTeX syntax highlighting
let g:vim_markdown_math = 1
nnoremap <leader>ml :let g:vim_markdown_math = 0

" Map <j><j> to <ESC> for switching to 'normal' mode
inoremap jj <ESC>

"Clear the search buffer when hitting Ctrl-h
nnoremap <C-h> :nohlsearch<cr>

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
nmap <F6> :!sh /home/james/Dropbox/Scripts/ds qutebrowser --target window %:r.html<cr><cr>

" System Copy and Paste
map <Leader>p "+gp
map <Leader>y "+y

" Colorscheme selections
nnoremap <leader>de :colorscheme desert<cr>
nnoremap <leader>ma :colorscheme material<cr>
nnoremap <leader>g :colorscheme gruvbox<cr>
nnoremap <leader>pc :colorscheme PaperColor<cr>

" Window splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>r <C-w>r
nnoremap <leader>, <C-w><C-w>

" Scratchpad for random notes
nnoremap <leader>s :tabnew ~/Dropbox/SCRATCHPAD.md<cr>

" .vimrc editing/sourcing
nnoremap <leader>ve :tabnew ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" Disables arrow keys in insert mode
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

nnoremap <up> gk
nnoremap <down> gj

" Autosaves folds on exit and autoloads folds on start
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"" Backup, Swap and Undo
set undofile
set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
set undodir=~/.vim/undo,/tmp
