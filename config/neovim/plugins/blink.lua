local servers = {
	angularls = {},
	clangd = {},
	cssls = {},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = {
					library = vim.api.nvim_list_runtime_paths(),
				},
			},
		},
	},
	html = {},
	nil_ls = {},
	pyright = {},
	qmlls = {},
	rust_analyzer = {},
	ts_ls = {},
	vue_ls = {},
}

local blink = require("blink.cmp")
for server, config in pairs(servers) do
	config.capabilities = blink.get_lsp_capabilities(config.capabilities)
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
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
		trigger = { show_in_snippet = false },
		list = { selection = { preselect = true, auto_insert = true } },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = { preset = "super-tab" },
	["<C-e>"] = { "hide" },
	signature = { enabled = true },
	sources = { default = { "lsp", "path", "snippets" } },
})
