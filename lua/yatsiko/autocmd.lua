local ignored_filetypes = {
    ['analysis_options.yaml'] = true,
    ['[dap-repl]'] = true,
    ['__FLUTTER_DEV_LOG__'] = true,
    ['DAP Scopes'] = true,
    ['DAP Breakpoints'] = true,
    ['DAP Stacks'] = true,
    ['DAP Watches'] = true,
}

local winSystemGroup = vim.api.nvim_create_augroup('WindowsSystem', { clear = true })

-- Places focused float window on top
vim.api.nvim_create_autocmd('WinEnter', {
    group = winSystemGroup,
    callback = function()
        local config = vim.api.nvim_win_get_config(0)

        if config.relative ~= '' and config.relative ~= nil then
            local highest_zindex = -1

            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local zindex = vim.api.nvim_win_get_config(win).zindex
                if zindex == nil then
                    goto continue
                end
                if zindex > highest_zindex then
                    highest_zindex = zindex
                end
                ::continue::
            end

            vim.api.nvim_win_set_config(0, { zindex = highest_zindex + 1 })
        end
    end
})

-- Write and delete hidden buffers
vim.api.nvim_create_autocmd('BufHidden', {
    group = winSystemGroup,
    callback = function()
        local file = vim.fn.expand('<afile>')
        local buf = tonumber(vim.fn.expand('<abuf>'))

        if file ~= '' and not ignored_filetypes[file] and buf then
            if vim.bo.modified then
                vim.api.nvim_buf_call(buf, function()
                    vim.cmd.write()
                end)
            end
            vim.schedule(function()
                vim.api.nvim_buf_delete(buf, { force = true })
            end)
        end
    end
})
