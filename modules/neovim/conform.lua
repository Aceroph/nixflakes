require("conform").setup {
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		nix = { "nixfmt" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		html = { "prettierd" },
		css = { "prettierd" },
		json = { "jsonfmt" },
	},
}
