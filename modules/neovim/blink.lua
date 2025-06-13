local lspconfig = require("lspconfig")
local blink = require("blink.cmp")
local servers = {
    rust_analyzer = {},
    pyright = {},
    lua_ls = {},
    cssls = {},
    html = {},
    jsonls = {},
    volar = {},
    nil_ls = {},
    eslint = {},
    nimls = {},
}
for server, config in pairs(servers) do
    config.capabilities = blink.get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
end

blink.setup {
    keymap = { preset = "enter" },
    signature = { enabled = true },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
}
