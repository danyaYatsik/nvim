return {
    'numToStr/FTerm.nvim',
    config = function()
        local fterm = require('FTerm')
        ---@diagnostic disable-next-line: missing-fields
        fterm.setup({
            border = 'rounded',
            ---@diagnostic disable-next-line: missing-fields
            dimensions = {
                height = 0.5,
                width  = 0.5,
            },
        })
        vim.keymap.set('n', '<leader>tt', fterm.toggle)
        vim.api.nvim_create_user_command('DartGenerate', function()
            fterm.scratch({ cmd = { 'dart', 'run', 'build_runner', 'build', '--delete-conflicting-outputs' } })
        end, { bang = true })
        vim.api.nvim_create_user_command('NpmStart', function()
            fterm.scratch({ cmd = { 'npm', 'start' } })
        end, { bang = true })
    end
}
