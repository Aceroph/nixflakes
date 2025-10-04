local servers = {
	angularls = {},
	rust_analyzer = {},
	pyright = {},
	lua_ls = {},
	cssls = {},
	html = {},
	jsonls = {},
	volar = {},
	nil_ls = {},
	ts_ls = {},
	nimls = {},
	clangd = {},
}

local blink = require("blink.cmp")
for server, config in pairs(servers) do
	config.capabilities = blink.get_lsp_capabilities(config.capabilities)
	vim.lsp.config[server].setup(config)
end

blink.setup({
	cmdline = { enabled = false },
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 150,
		},
		ghost_text = { enabled = true },
		keyword = { range = "full" },
		list = { selection = { preselect = false, auto_insert = true } },
	},
	keymap = { preset = "enter" },
	signature = { enabled = true },
	sources = { default = { "lsp", "path", "snippets" } },
})
