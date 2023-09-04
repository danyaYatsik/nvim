return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim',
    },
    config = function ()
        require('flutter-tools').setup({
            outline = {
                open_cmd = "30vnew",
                auto_open = true
            },
          --  decorations = {
          --      statusline = {
          --          app_version = true,
          --          device = true,
          --          project_config = true,
          --      }
          --  },
            debugger = {
                enabled = true,
                run_via_dap = true,
                exception_breakpoints = {}
            },
            widget_guides = {
                enabled = true,
            },
        })
        require('flutter-tools').setup_project({
            name = 'development',
            flavor = 'stage',
            device = 'sdk gphone64 x86 64',
            target = 'lib/main.dart',
        })

        local commands = require('flutter-tools.commands')
        local devices = require('flutter-tools.devices')
        local outline = require('flutter-tools.outline')

        vim.keymap.set('n', '<leader>fq', commands.quit)
        vim.keymap.set('n', '<leader>fR', commands.reload)
        vim.keymap.set('n', '<leader>fr', commands.restart)
        vim.keymap.set('n', '<leader>fm', commands.visual_debug)
        vim.keymap.set('n', '<leader>fd', devices.list_devices)
        vim.keymap.set('n', '<leader>fo', outline.toggle)
    end,
}
