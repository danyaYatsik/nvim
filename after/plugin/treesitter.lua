require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"javascript", "typescript", "c", "lua", "vim", "vimdoc", "bash", "cmake", "css", "dart",
		"diff", "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore", "graphql", "html", "java", "jsdoc",
		"json", "make", "markdown_inline", "php", "python", "scss", "solidity", "sql", "yaml", "dart"
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
