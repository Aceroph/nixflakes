-- Options
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.mkdp_filetypes = { "markdown", "plantuml" }

-- Keybinds
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show error at cursor" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope - Find files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope - Live grep" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })

-- Debugging keybinds
vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "Debug: Open REPL" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Debug: Run last" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end, { desc = "" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "" })
vim.keymap.set('n', '<Leader>df', function() require('dap.ui.widgets').centered_float(widgets.frames) end, { desc = "" })
vim.keymap.set('n', '<Leader>ds', function() require('dap.ui.widgets').centered_float(widgets.scopes) end, { desc = "" })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Debug: Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Debug: Step over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Debug: Step into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Debug: Step out" })
