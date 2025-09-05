local servers = {
    angularls = {},
    rust_analyzer = {},
    pyright = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    },
    cssls = {},
    html = {},
    jsonls = {},
    volar = {},
    nil_ls = {},
    eslint = {},
    nimls = {},
    clangd = {},
}

local lspconfig = require("lspconfig")
local blink = require("blink.cmp")
for server, config in pairs(servers) do
    config.capabilities = blink.get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
end

blink.setup {
    keymap = { preset = "enter" },
    signature = { enabled = true },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = true, },
        keyword = { range = "full", },
    }
}
