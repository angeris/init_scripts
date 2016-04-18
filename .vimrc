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
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

let python_highlight_all=1
syntax on

let g:SimpylFold_docstring_preview=1

set tabstop=4 shiftwidth=4 expandtab

" Autocomplete stuff
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree stuff
map <C-n> :NERDTreeToggle<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

inoremap <S-TAB> <C-D>
nmap <C-o> O<Esc>
"tab navigation
nmap <C-a> :vsplit<CR>  " Open a new tab
nmap <C-l> :split<CR>

nmap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR> " Move current tab to the left
nmap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>    " Move current tab to the right

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with spacebar
nnoremap <space> za

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
