return {
    'https://gitlab.com/yorickpeterse/nvim-window.git',
    config = function()
        local window = require('nvim-window')
        window.setup({
            chars = {
                'j', 'k', 'l', 'd', 'i', 'o', 'g', 'h', 'e', 'a', 'b', 'c', 'm', 'n', 'f',
                'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
            },

            normal_hl = 'Float',

            hint_hl = 'Bold',

            border = 'rounded'
        })

        vim.keymap.set('n', '<leader>w', window.pick)
    end
}
