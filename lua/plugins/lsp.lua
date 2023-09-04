return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',             -- Required
        'williamboman/mason.nvim',           -- Optional
        'williamboman/mason-lspconfig.nvim', -- Optional

        -- Autocompletion
        'hrsh7th/nvim-cmp',     -- Required
        'hrsh7th/cmp-nvim-lsp', -- Required
        'L3MON4D3/LuaSnip',     -- Required
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset({})

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        lsp.defaults.cmp_mappings({
            ['C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
        })

        lsp.set_preferences({ sign_icons = {} })

        lsp.on_attach(function(_, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buclientffer = bufnr })
            local opts = { buffer = bufnr, remap = false }
            local goto = require('goto-preview')

            vim.keymap.set("n", "gd", function() goto.goto_preview_definition({}) end, opts)
            vim.keymap.set("n", "gi", function() goto.goto_preview_implementation({}) end, opts)
            vim.keymap.set("n", '<leader>vrr', function() goto.goto_preview_references() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end, opts)
            vim.keymap.set("n", '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", 'C-h', function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", '<leader>=', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
                opts)
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()
    end
}
