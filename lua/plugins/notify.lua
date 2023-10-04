function Notify(text)
    require('notify')(text)
end
return {
    'rcarriga/nvim-notify',
    --enabled = false,
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
        local notify = require('notify')
        notify.setup({
            background_colour = "#000000",
        })
        vim.notify = notify
        vim.keymap.set('n', '<leader>pn', function()
            require('telescope').extensions.notify.notify()
        end)
    end
}
