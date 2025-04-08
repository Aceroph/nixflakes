local lspconfig = require("lspconfig")
local blink = require("blink.cmp")
local servers = {
	rust_analyzer = {
		diagnostic = { enable = true },
		proc_macro = { enable = true },
	},
	pyright = {},
	lua_ls = {},
	cssls = {},
	html = {},
	jsonls = {},
	volar = {},
	nil_ls = {},
	eslint = {},
}
for server, config in pairs(servers) do
	config.capabilities = blink.get_lsp_capabilities(config.capabilities)
	lspconfig[server].setup(config)
end
blink.setup {
	keymap = { preset = "enter" },
	signature = { enabled = true },
}
