M = {}

function M.setup()
    -- Set up lspconfig.
    local lsp = require('lspconfig')
    lsp['julials'].setup{}
    lsp['rust_analyzer'].setup{}
    lsp['zls'].setup{}
    lsp['lua_ls'].setup{}

    -- Set up coq
    vim.g.coq_settings = {
        auto_start = 'shut-up'
    }

     -- Set up nvim-treesitter
     -- require('nvim-treesitter.configs').setup {
     --     ensure_installed = { "julia", "rust", "comment", "zig", "bibtex", "latex", "lua" },
     --     auto_install = true,
     -- }

    -- Set up colorscheme
    -- vim.cmd('colorscheme gruvbox-material')

    require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        styles = {
            transparency = true,
            italic = false,
        },
    })

    vim.cmd("colorscheme rose-pine")

    -- Set up Julia stuff
    vim.cmd('hi link juliaFunctionCall Identifier')
    vim.cmd('autocmd FileType julia nmap <buffer> ? <Plug>(JuliaDocPrompt)')

    -- Lualine config
    -- local custom_gruvbox = require'lualine.themes.gruvbox-material'
    -- require('lualine').setup{
    --     options = { theme = custom_gruvbox },
    -- }
    require("lualine").setup({
        options = {
            --- @usage 'rose-pine' | 'rose-pine-alt'
            theme = "rose-pine"
        }
    })

    -- Toggle term config
    require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        start_in_insert = true,
        autochdir = true,
        direction = 'float',
        size = vim.o.columns * .4
    }
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end
return M
