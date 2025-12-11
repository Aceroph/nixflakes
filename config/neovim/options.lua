-- Options
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.g.mkdp_filetypes = { "markdown", "plantuml" }

-- Keybinds
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show error at cursor" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope - Find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope - Live grep" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>a", require("actions-preview").code_actions, { desc = "Show code actions" })

-- Debugging keybinds
local dap = require("dap")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Debug: Run last" })
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step out" })

-- NeoTree keybinds
vim.keymap.set("n", "<leader>t", "<cmd>Neotree<CR>", { desc = "Open files" })
vim.keymap.set("n", "<leader>T", "<cmd>Neotree close<CR>", { desc = "Open files" })
vim.keymap.set("n", "<leader>gh", "<cmd>Neotree git_status float<CR>", { desc = "Open git status" })
vim.keymap.set("n", "<leader>bf", "<cmd>Neotree buffers float<CR>", { desc = "Open buffers" })
vim.keymap.set("n", "<leader>sy", "<cmd>Neotree document_symbols<CR>", { desc = "Open document symbols" })

vim.cmd([[ 
  colorscheme retrobox

  set clipboard=unnamedplus
]])
