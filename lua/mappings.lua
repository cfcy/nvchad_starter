require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts={
        row = 0.00,
        col = 0.00,
        width = 1.0,
        height = 1.0
    }}
end, { desc = "terminal toggle floating term" })

map("n", "gm", "<cmd>call cursor(0, virtcol('$')/2)<CR>", { desc = "go to middle of line", noremap = true, silent = true })

-- Switch between source and header
map('n', '<leader>h', '<cmd>ClangdSwitchSourceHeader<CR>', {desc = "Switch between src/header", noremap = true, silent = true})

-- Disable diagnostics
map('n', '<leader>dd', vim.diagnostic.disable, {desc = "Disable diagnostic", noremap = true, silent = true})

-- Enable diagnostics
map('n', '<leader>de', vim.diagnostic.enable, {desc = "Enable diagnostic", noremap = true, silent = true})

-- Close all buffers
map('n', '<leader>cx', function()
    require("nvchad.tabufline").closeAllBufs()
end, {desc = "Close all buffers"})

-- Close all buffers except current one
map('n', '<leader>cb', function()
    require("nvchad.tabufline").closeOtherBufs()
end, {desc = "Close all buffers except current one"})

-- Toggle Symbols-Outline
map('n', '<leader>o', '<cmd>SymbolsOutline<CR>', {desc = "Toggle Symbols-Outline"})
