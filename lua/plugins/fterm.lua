return {
    'numToStr/FTerm.nvim',
    config = function()
        local fterm = require('FTerm')
        fterm.setup({
            border = 'rounded',
            dimensions = {
                height = 0.5,
                width  = 0.5,
            },
        })
        vim.keymap.set('n', '<leader>tt', fterm.toggle)
        vim.api.nvim_create_user_command('DartGenerate', function()
            fterm.scratch({ cmd = {'dart', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'} })
        end, { bang = true })
    end
}
