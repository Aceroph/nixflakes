-- Options
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.g.mkdp_filetypes = { "markdown", "plantuml" }

-- Keybinds
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show error at cursor" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope - Find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope - Live grep" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = "ToggleTerm - Exit terminal" })
