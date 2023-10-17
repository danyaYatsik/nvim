return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "folke/noice.nvim",
    },
    config = function()
        local noice = require('noice').api.status

        require('lualine').setup({
            options = {
                globalstatus = true
            },
            sections = {
                lualine_x = {
                    {
                        noice.mode.get,
                        cond = noice.mode.has,
                    },
                    'encoding',
                    'fileformat',
                    'filetype'
                }
            },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        mode = 0,
                        max_length = vim.o.columns / 8,
                        use_mode_colors = true,
                    }
                },
                lualine_z = {
                    {
                        'buffers',
                        max_length = vim.o.columns / 8 * 7,
                        use_mode_colors = true,
                    }
                }
            },
        })
    end
}
