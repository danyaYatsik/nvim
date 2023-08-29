return {
    'echasnovski/mini.nvim',
    config = function ()
        require('mini.misc').setup()
        MiniMisc.setup_auto_root()
        MiniMisc.setup_restore_cursor()

        require('mini.sessions').setup({
            autoread = false,
            autowrite = true,
            file = 'Session.vim',
        })

        require('mini.starter').setup()
        require('mini.indentscope').setup()
        require('mini.comment').setup()
    end
}

