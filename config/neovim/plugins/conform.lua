require("conform").setup {
    format_on_save = {
        timeout_ms = 4500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        nix = { "nixfmt" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "jsonfmt" },
        c = { "clang-format" }
    },
}
