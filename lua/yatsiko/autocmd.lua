local function go_to_preview()
    local buf = vim.api.nvim_get_current_buf()
    local pos = vim.fn.getcurpos()
    vim.api.nvim_win_hide(0)
    vim.api.nvim_win_set_buf(0, buf)
    if pos ~= nil then
        vim.fn.setpos('.', pos)
    end
end

local winSystemGroup = vim.api.nvim_create_augroup('WindowsSystem', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = winSystemGroup,
    callback = function()
        local config = vim.api.nvim_win_get_config(0)

        if config.relative ~= '' and config.relative ~= nil then
            vim.keymap.set('n', '<C-w>g', go_to_preview)

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

vim.api.nvim_create_autocmd('BufHidden', {
    group = winSystemGroup,
    callback = function()
        local file = vim.fn.expand('<afile>')
        local buf = tonumber(vim.fn.expand('<abuf>'))

        if file and file ~= '' and buf then
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
