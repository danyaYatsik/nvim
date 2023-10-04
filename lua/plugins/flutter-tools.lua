return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('flutter-tools').setup({
            outline = {
                open_cmd = "30vnew",
                auto_open = false,
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
                exception_breakpoints = {}
            },
            widget_guides = {
                enabled = true,
            },
            lsp = {
                settings = {
                    lineLength = 150,
                    showTodos = true,
                    renameFilesWithClasses = true
                }
            }
        })
        require('flutter-tools').setup_project({
            {
                name = 'sdk gphone64 x86 64',
                flavor = 'stage',
                device = 'sdk gphone64 x86 64',
                target = 'lib/main.dart',
            },
            {
                name = 'Standard PC i440FX, PIIX 1996',
                flavor = 'stage',
                device = 'Standard PC i440FX, PIIX 1996',
                target = 'lib/main.dart',
            }
        })

        local commands = require('flutter-tools.commands')
        local outline = require('flutter-tools.outline')

        vim.keymap.set('n', '<leader>fq', commands.quit)
        vim.keymap.set('n', '<leader>fR', commands.reload)
        vim.keymap.set('n', '<leader>fr', commands.restart)
        vim.keymap.set('n', '<leader>fm', commands.visual_debug)
        vim.keymap.set('n', '<leader>fd', commands.run)
        vim.keymap.set('n', '<leader>fo', outline.toggle)
        vim.keymap.set('n', '<leader>fl', function()
            vim.cmd('FlutterLogClear')
        end)
    end,
}
