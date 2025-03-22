vim.opt.runtimepath:prepend("~/.local/share/nvim/site/parser/")
require("nvim-treesitter.configs").setup {
	parser_install_dir = "~/.local/share/nvim/site/parser/",
	highlight = {
		enable = true,
		additional_vim_regex_hightlighting = false,
	},
}
