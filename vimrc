set nocompatible    " be iMproved, Vundle required
filetype off        " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Personal plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
" End of personal plugins

call vundle#end()     " required
filetype plugin indent on " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"                       :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                       auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Swap file stuff
set swapfile
set dir=/tmp

" Backspace works normally
set backspace=indent,eol,start

" Set colors for linux terminal
set t_Co=256

" Keep syntax on
syntax on

" Opening file hides current file rather than closes
set hidden

" Wrap lines
set wrap

" Set cursor line highlight
set cursorline

" Line and column numbers
set ruler
set nu
set relativenumber

" Status line
set laststatus=2

" Theme
set background=dark
colorscheme hybrid_material

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" vim-gitgutter by default
let g:gitgutter_enabled = 1

" close vim if only tab up is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
	\ b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""
""""""""""" Custom stuff """"""""""""""
"""""""""""""""""""""""""""""""""""""""
" leader key to ,
let mapleader = ","

" Remove -- INSERT -- from below airline
set noshowmode

" Highlight lines over 80 chars
highlight OverLength ctermbg=blue ctermfg=black guibg=#592929
match OverLength /\%81v.\+/

" Maybe I should highlight or something with tabs?
" highlight Tab ctermbg=white ctermfg=black
" match Tab /\t/

" Ctrl-D: Move to now line
map <C-D> i<BS><CR><ESC>

" Ctrl-X: Save file
nnoremap <C-X> :w<CR>
inoremap <C-X> <C-O>:w<CR>

" <leader>n: Toggle NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

" <leader>r: source vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

" <leader>p: CtrlP
nnoremap <leader>p :CtrlP<CR>

" Make switching between panes interfere with tmux less
nnoremap <C-h> <C-W><Left>
nnoremap <C-j> <C-W><Down>
nnoremap <C-k> <C-W><Up>
nnoremap <C-l> <C-W><Right>

" Tabs are 2, no spaces. Makefile tabs automatically do 8
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Fix tabs to do 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" For zooming into window
let g:zoomed = 0

function! Zoom()
  if g:zoomed == 0
    execute "normal \<C-w>\|"
    let g:zoomed=1
  else
    execute "normal \<C-w>\="
    let g:zoomed=0
  endif
endfunction

nnoremap <C-z> :call Zoom()<cr>
