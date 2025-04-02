-- Options
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Keybinds
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show error at cursor" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope - Find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope - Live grep" })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = "ToggleTerm - Exit terminal" })
