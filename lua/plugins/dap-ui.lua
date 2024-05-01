return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        "mxsdev/nvim-dap-vscode-js",
        {
            "microsoft/vscode-js-debug",
            version = "1.x",
            build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
        }
    },
    config = function()
        local dapui, dap, dap_vscode = require('dapui'), require('dap'), require('dap-vscode-js')
        dap.defaults.fallback.switchbuf = 'useopen'
        dapui.setup({
            layouts = {
                {
                    elements = { 'scopes', 'watches', 'breakpoints', 'stacks' },
                    size = 40,
                    position = "left", -- Can be "left" or "right"
                },
            },
        })
        dap_vscode.setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
        })
        for _, language in ipairs({ 'typescript', 'javascript', 'typescriptreact' }) do
            dap.configurations[language] = {
                {
                    type = "pwa-chrome",
                    name = "Launch Chrome to debug client",
                    request = "launch",
                    url = "http://localhost:5173",
                    sourceMaps = true,
                    protocol = "inspector",
                    port = 9222,
                    webRoot = "${workspaceFolder}/src",
                    -- skip files from vite's hmr
                    -- skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
                }
            }
        end

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
