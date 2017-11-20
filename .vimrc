set backspace=2

set number " Set line numbers to be visible

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tomlion/vim-solidity'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

let python_highlight_all=1
syntax on

" Syntax for Python3
let g:syntastic_python_python_exec = 'python'
let g:ycm_python_binary_path = 'python'

let g:SimpylFold_docstring_preview=1

set tabstop=4 shiftwidth=4 expandtab

" Autocomplete stuff
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-]> :YcmCompleter GoToDeclaration<CR>

" NERDTree stuff
map <C-n> :NERDTreeToggle<CR>

" Autopep8 stuff
let g:autopep8_max_line_length=79

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let mapleader=","
inoremap <S-TAB> <C-D>
nmap <C-o> O<Esc>
"tab navigation
nmap <C-a> :vsplit<CR>  " Open a new tab
nmap <C-m> :split<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with spacebar
nnoremap <space> za

" Enable running directly from vim
nnoremap <silent> <F5> :!clear;python %<CR>

set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=10
set nofoldenable
set mouse=a
set ls=2 " Show a status line even when only one window is shown
set showcmd " Show command completion as typing command
set incsearch " Highlight as searched phrase is entered
set hlsearch " Highlight searched phrases
set ruler " Always show info along bottom
set title " Always show title of file along bottom
set tabstop=4 " Number of columns in a tab
set shiftwidth=4  " Number of columns with << and >> and auto C-style indentation
set softtabstop=4 " Number of columns the Tab inserts in insert mode
set expandtab " Expand tabs into spaces

command C let @/=""
"commands to handle common typing errors
""make W behave like w
command W w
"make Q behave like q
command Q q
""make E behave like e
command -nargs=? -complete=file E edit <args>

"setting up solarized colorscheme
let g:solarized_termcolors=256
set background=dark
" colorscheme solarized

let asmsyntax='armasm' 
let filetype_inc='armasm'

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
