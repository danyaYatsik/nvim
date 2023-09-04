function ColorMyPencils(sheme)
    sheme = sheme or 'falcon'
    vim.cmd.colorscheme(sheme)
end

return {
    { 'fenetikm/falcon' },
    { "bluz71/vim-moonfly-colors", name = "moonfly",    priority = 1000 },
    { "catppuccin/nvim",           name = "catppuccin", },
    { 'kvrohit/mellow.nvim' },
    { "rebelot/kanagawa.nvim" },
    { 'sam4llis/nvim-tundra' },
    { 'joshdick/onedark.vim', }
}
