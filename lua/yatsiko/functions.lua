function WindowYank()
    vim.fn.setreg('w', vim.fn.expand('%'))
    vim.cmd.close()
end

function WindowPaste()
    vim.cmd.vsplit()
    vim.cmd.edit(vim.fn.getreg('w'))
end

function CloseOthers()
    ---@diagnostic disable-next-line: param-type-mismatch -- Yes, you can
    local current_buf = vim.fn.bufnr('%')

    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        if buf.bufnr ~= current_buf then
            vim.api.nvim_buf_delete(buf.bufnr, {})
        end
    end
end

function ColorMyPencils(scheme)
    scheme = scheme or 'falcon'
    vim.cmd.colorscheme(scheme)
end

function DefloatWindow()
    local win_config = vim.api.nvim_win_get_config(0)

    Notify(win_config.relative)
    Notify(nil)
    do return end
    local buf = vim.api.nvim_get_current_buf()
    local pos = vim.fn.getcurpos()
    vim.api.nvim_win_hide(0)
    local wins = vim.api.nvim_tabpage_list_wins(0)

    for _, win in ipairs(wins) do
        local win_config = vim.api.nvim_win_get_config(win)

        if (win_config.relative == '') then
            vim.api.nvim_win_set_buf(win, buf)

            if pos ~= nil then
                vim.fn.setpos('.', pos)
            end
        else
            vim.api.nvim_win_hide(win)
        end
    end
end
