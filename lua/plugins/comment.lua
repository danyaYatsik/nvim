return {
    'numToStr/Comment.nvim',
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
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
            },
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end
}
