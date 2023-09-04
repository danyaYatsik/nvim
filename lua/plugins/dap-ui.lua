return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap'
    },
    config = function()
        local dapui, dap = require('dapui'), require('dap')
        dap.defaults.fallback.switchbuf = 'useopen'
        dapui.setup({
            layouts = {
                {
                    elements = { 'scopes', 'breakpoints', 'watches', 'stacks' },
                    size = 40,
                    position = "left", -- Can be "left" or "right"
                },
            },
        })

        vim.keymap.set('n', '<leader>dui', dapui.toggle)
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>dc', dap.continue)
        vim.keymap.set('n', '<leader>dl', dap.clear_breakpoints)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}
