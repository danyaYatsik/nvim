return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim', 'xiyaowong/transparent.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    '*.png', '*.jpeg', '*.svg', '*.pdf', 'node_modules'
                },
            }
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep)
        vim.keymap.set('n', '<leader>pj', builtin.jumplist)
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics)
        vim.keymap.set('n', '<leader>pb', builtin.buffers)
    end
}
