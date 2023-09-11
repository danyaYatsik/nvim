return {
    'nvim-focus/focus.nvim',
    version = false,
    config = function ()
        local focus = require('focus')
        focus.setup({
            split = {
                bufnew = true,
                minheight = 1,
            },
            autoresize = {
                minwidth = 1,
                minheight = 1,
            },
        })
        vim.keymap.set('n', '<C-w>a', focus.focus_max_or_equal)
    end
}

