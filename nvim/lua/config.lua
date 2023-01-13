M = {}

function M.setup()
    -- Set up nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
            end,
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
            ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'buffer', keyword_length = 3 },
        })
    })

    -- Set up lspconfig.
    require('lspconfig')['julials'].setup{}
    require('lspconfig')['rust_analyzer'].setup{}
    require('lspconfig')['zls'].setup{}
    require('lspconfig')['sumneko_lua'].setup{}

     -- Set up nvim-treesitter
     require('nvim-treesitter.configs').setup {
         ensure_installed = { "julia", "rust", "comment", "zig", "bibtex", "latex", "lua" },
         auto_install = true,
     }

    -- Set up colorscheme
    vim.cmd('colorscheme gruvbox-material')

    -- Set up Julia stuff
    vim.cmd('hi link juliaFunctionCall Identifier')
    vim.cmd('autocmd FileType julia nmap <buffer> ? <Plug>(JuliaDocPrompt)')

    -- Lualine config
    local custom_gruvbox = require'lualine.themes.gruvbox-material'
    require('lualine').setup{
        options = { theme = custom_gruvbox },
    }

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
