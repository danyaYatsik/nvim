local ignore_filetypes = { 'neo-tree' }
local ignore_buftypes = { 'prompt', 'popup' }

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})

return {
    'nvim-focus/focus.nvim',
    version = false,
    config = function()
        local focus = require('focus')
        focus.setup({
            split = {
                bufnew = true,
                minheight = 1,
            },
            autoresize = {
                minwidth = 1,
                minheight = 1,
            },
            ui = {
                signcolumn = false
            }
        })
        vim.keymap.set('n', '<C-w>m', focus.focus_maximise)
        vim.keymap.set('n', '<C-w>t', function()
            focus.focus_disable()
            focus.focus_enable()
        end)
        vim.keymap.set('n', '<C-w>=', focus.focus_equalise)
    end
}
