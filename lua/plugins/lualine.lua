return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true
            },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        mode = 2,
                        use_mode_colors = true,
                    }
                },
            },
        })
    end
}
