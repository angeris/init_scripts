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

filetype plugin indent on
syntax on

set mouse=a

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fannheyward/coc-julia'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    Plug 'morhetz/gruvbox'
    Plug 'ziglang/zig.vim'
call plug#end()

" -- Plugin settings
colorscheme gruvbox

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
nnoremap <C-f> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-p> :Rg<CR>

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Coc Keyboard shortcuts
nnoremap <silent> <Leader>j <Plug>(coc-diagnostic-next)
nnoremap <silent> <Leader>k <Plug>(coc-diagnostic-prev)
nnoremap <silent> <Leader>d :CocDiagnostics<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
