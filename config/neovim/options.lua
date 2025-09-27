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
vim.keymap.set('n', "<leader>a", require("actions-preview").code_actions, { desc = "Show code actions" })

-- Debugging keybinds
vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set('n', '<Leader>dr', require('dap').repl.open, { desc = "Debug: Open REPL" })
vim.keymap.set('n', '<Leader>dl', require('dap').run_last, { desc = "Debug: Run last" })
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = "Debug: Continue" })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = "Debug: Step over" })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = "Debug: Step into" })
vim.keymap.set('n', '<F12>', require('dap').step_out, { desc = "Debug: Step out" })

-- NeoTree keybinds
vim.keymap.set('n', '<leader>t', '<cmd>Neotree<CR>', { desc = "Open files" })
vim.keymap.set('n', '<leader>gh', '<cmd>Neotree git_status float<CR>', { desc = "Open git status" })
vim.keymap.set('n', '<leader>bf', '<cmd>Neotree buffers float<CR>', { desc = "Open buffers" })
vim.keymap.set('n', '<leader>sy', '<cmd>Neotree document_symbols<CR>', { desc = "Open document symbols" })

-- Statusline
local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#StatusLine#"
    if current_mode == "n" then
        mode_color = "%#DiffAdd#"
    elseif current_mode == "i" or current_mode == "ic" then
        mode_color = "%#DiffText#"
    elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
        mode_color = "%#DiffChange#"
    elseif current_mode == "R" then
        mode_color = "%#CurSearch#"
    elseif current_mode == "c" then
        mode_color = "%#CurSearch#"
    elseif current_mode == "t" then
        mode_color = "%#DiffText#"
    end
    return mode_color
end

local function filename()
    local fname = vim.fn.expand "%:t"
    if fname == "" then
        return ""
    end
    return fname .. " "
end

local function lsp()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""
    local empty = true

    if count["errors"] ~= 0 then
        errors = string.format(" E%s", count["errors"])
        empty = false
    end
    if count["warnings"] ~= 0 then
        warnings = string.format(" W%s", count["warnings"])
        empty = false
    end
    if count["hints"] ~= 0 then
        hints = string.format(" H%s", count["hints"])
        empty = false
    end
    if count["info"] ~= 0 then
        info = string.format(" I%s", count["info"])
        empty = false
    end

    if empty then
        return " :D "
    end

    return errors .. warnings .. hints .. info .. " "
end

local function filetype()
    return " " .. (vim.bo.filetype or "void") .. " "
end

Statusline = {}

Statusline.active = function()
    local accent = update_mode_colors()
    return table.concat {
        accent,
        mode(),
        "%#StatusLineNC# ",
        filename(),
        "%=%#StatusLine#",
        filetype(),
        accent,
        lsp(),
        accent,
    }
end

function Statusline.inactive()
    return " %F"
end

function Statusline.short()
    return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
