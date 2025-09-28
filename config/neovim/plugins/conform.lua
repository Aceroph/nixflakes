require("conform").setup {
    format_on_save = {
        timeout_ms = 4500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        json = { "jsonfmt" },
        lua = { "stylua" },
        nix = { "nixfmt" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        typescript = { "prettierd" },
    },
}
