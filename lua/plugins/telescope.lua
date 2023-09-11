return {
    'nvim-telescope/telescope.nvim', version = '0.1.1',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function ()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    'assets/'
                }
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>hh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep)
        vim.keymap.set('n', '<leader>jl', builtin.jumplist)
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics)
    end
}
