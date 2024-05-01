return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        'joechrisellis/lsp-format-modifications.nvim',

        -- LSP Support
        'neovim/nvim-lspconfig',             -- Required
        'williamboman/mason.nvim',           -- Optional
        'williamboman/mason-lspconfig.nvim', -- Optional
        'stevearc/dressing.nvim',

  -- Autocompletion
        'hrsh7th/nvim-cmp',     -- Required
        'hrsh7th/cmp-nvim-lsp', -- Required
        'L3MON4D3/LuaSnip',     -- Required
    },
    config = function()
        local lsp = require('lsp-zero')
        local goto = require('goto-preview')
        local cmp = require('cmp')
        local format_modifications = require('lsp-format-modifications')
        lsp.preset({})

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        lsp.defaults.cmp_mappings({
            ['C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
        })

        lsp.set_preferences({ sign_icons = {} })

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "<leader>gd", function() goto.goto_preview_definition({}) end, opts)
            vim.keymap.set("n", "<leader>gi", function() goto.goto_preview_implementation({}) end, opts)
            vim.keymap.set("n", '<leader>gr', function() goto.goto_preview_references() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "[k", function() vim.diagnostic.show_line_diagnostics() end, opts)
            vim.keymap.set("n", '<leader>ga', function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", '<leader>gn', vim.lsp.buf.rename, opts)
            vim.keymap.set("n", '<leader>gs', function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", '<leader>=', function()
                -- vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                format_modifications.format_modifications(client, bufnr)
            end,
                opts)
        end)

        local lsp_config = require('lspconfig')
        lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'jdtls', 'lua_ls'},
            handlers = {
                lsp.default_setup,
                jdtls = lsp.noop,
            }
        })
        lsp.setup()

    end
}
