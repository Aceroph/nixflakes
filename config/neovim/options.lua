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
