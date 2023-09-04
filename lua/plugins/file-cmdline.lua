return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
        { 'MunifTanjim/nui.nvim' }
    },
    config = function()
        local fineline = require('fine-cmdline')
        fineline.setup({
            cmdline = {
                prompt = '>: ',
                emable_keymaps = false
            },
            hooks = {
                set_keymaps = function(imap, _)
                    imap('<C-n>', fineline.fn.up_search_history)
                    imap('<C-p>', fineline.fn.down_search_history)
                end
            }
        })
        vim.keymap.set('n', '<CR>', function() fineline.open({ default_value = "" }) end)
    end
}