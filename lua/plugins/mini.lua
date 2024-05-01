return {
    'echasnovski/mini.nvim',
    config = function ()
        require('mini.misc').setup()
        MiniMisc.setup_auto_root({'gradlew', 'package.json'})
        MiniMisc.setup_restore_cursor()

        require('mini.sessions').setup({
            autoread = false,
            autowrite = true,
            file = 'Session.vim',
        })

        require('mini.starter').setup({
            footer = 'fuck it'
        })
        require('mini.indentscope').setup()
    end
}

