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
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'hrsh7th/cmp-omni'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    Plug 'ziglang/zig.vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

" -- Plugin settings
set background=dark

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
function NerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <C-n> :call NerdToggle()<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Rg<CR>

" Julia highlighting

set completeopt=menu,menuone,noselect

lua <<EOF
    require'config'.setup()
EOF

