set showmatch
set ignorecase
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set backspace=2

set number
set wildmode=longest,list
set spell spelllang=en_us

filetype plugin indent on
syntax on

set mouse=a

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/vim-markdown'
    Plug 'ziglang/zig.vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'rose-pine/neovim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

" Vimtex
let g:vimtex_view_method='skim'
let g:tex_flavor='latex'

" -- Keyboard shortcuts
inoremap jk <esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk

" Tab navigation
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right> :tabnext<CR>

" -- Plugin keyboard shortcuts
" function NerdToggle()
"     if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
"         :NERDTreeToggle
"     else
"         :NERDTreeFind
"     endif
" endfunction
" 
" nnoremap <C-n> :call NerdToggle()<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Rg<CR>

" Julia highlighting

set completeopt=menu,menuone,noselect

lua <<EOF
    require'config'.setup()
EOF

