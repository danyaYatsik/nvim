return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neo = require('neo-tree')

        neo.setup({
            filesystem = { }
        })

        vim.keymap.set('n', '\\', ':Neotree toggle reveal<CR>')
    end
}
