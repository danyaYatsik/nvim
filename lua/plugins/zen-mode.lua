return {
    "folke/zen-mode.nvim",
    config = function()
        local zen_mode = require('zen-mode')
        zen_mode.setup({
            window = {
                width = 1,
                height = 1,
            },
        })
        vim.keymap.set('n', '<C-w>y', zen_mode.toggle, {})
    end
}
