return {
    'nvim-treesitter/nvim-treesitter',
    build = function ()
        pcall(require('nvim-treesitter.install').update {with_sync = true})
    end,
    config = function ()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "javascript", "typescript",
                "c", "lua", "vim", "vimdoc",
                "bash", "cmake", "css",
                "diff", "dockerfile",
                "git_config", "git_rebase",
                "gitcommit", "gitignore",
                "graphql", "html", "java",
                "jsdoc", "json", "make",
                "markdown_inline", "php",
                "python", "scss", "sql",
                "yaml", "dart", "xml"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
