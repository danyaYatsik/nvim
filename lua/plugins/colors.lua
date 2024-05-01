return {
    { 'fenetikm/falcon' },
    { "bluz71/vim-moonfly-colors", name = "moonfly",    priority = 1000 },
    { "catppuccin/nvim",           name = "catppuccin", },
    { 'kvrohit/mellow.nvim' },
    { "rebelot/kanagawa.nvim" },
    { 'sam4llis/nvim-tundra' },
    { 'joshdick/onedark.vim', },
    { "folke/tokyonight.nvim",     priority = 1000,
        config = {
            transparent = true,
            styles = {
                sidebars = 'transparent',
                floats = 'transparent',
            },
            lualine_bold = false,
            on_highlights = function (hl, c)
                local black = '#000000'
                hl.Cursorline = {
                    fg = c.fg_black,
                    bg = black
                }
            end
        }
    }
}
