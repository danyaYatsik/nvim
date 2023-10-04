function WindowYank()
    vim.fn.setreg('w', vim.fn.expand('%'))
    vim.cmd.close()
end

function WindowPaste()
    vim.cmd.vsplit()
    vim.cmd.edit(vim.fn.getreg('w'))
end

function CloseOthers()
    local current_buf = vim.fn.bufnr('%')

    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        if buf.bufnr ~= current_buf then
            vim.api.nvim_buf_delete(buf.bufnr, {})
        end
    end
end

function ColorMyPencils(sheme)
    sheme = sheme or 'falcon'
    vim.cmd.colorscheme(sheme)
end
