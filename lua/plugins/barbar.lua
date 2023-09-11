return {
    {
        enabled = false,
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            auto_hide = true,
            tabpages = true,
            icons = {
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'er' }
                },
                gitsigns = {
                    added = {enabled = true, icon = '+'},
                    changed = {enabled = true, icon = '-'},
                    deleted = {enabled = true, icon = '-'},
                }
            }

        },
    },
}
