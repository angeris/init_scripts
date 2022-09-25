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
    Plug 'ellisonleao/gruvbox.nvim'
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

" Enable Julia LSP
lua << EOF
EOF

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback) 
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
        end),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer', keyword_length = 3 },
    })
  })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['julials'].setup{}
    require('lspconfig')['rust_analyzer'].setup{}
    require('lspconfig')['zls'].setup{}

     -- Set up nvim-treesitter
     require('nvim-treesitter.configs').setup {
         ensure_installed = { "julia", "rust", "comment", "zig", "bibtex", "latex" },
     }

    -- Set up colorscheme
    require('gruvbox').setup {
        italic=false,
    }
    vim.cmd('colorscheme gruvbox')
EOF

