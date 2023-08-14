return {
    'echasnovski/mini.nvim',
    config = function ()
        require('mini.misc').setup()
        MiniMisc.setup_auto_root()
        require('mini.starter').setup()
        require('mini.sessions').setup({
            autoread = false,
            autowrite = true,
            file = 'Session.vim',
        })
    end

}
