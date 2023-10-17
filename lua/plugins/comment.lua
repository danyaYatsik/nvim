return {
    'numToStr/Comment.nvim',
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('Comment').setup({
            sticky = false,
            toggler = {
                line = 'gcc',
                block = 'gbc'
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            mappings = {
                basic = true,
                extra = true,
            }
        })
    end
}
