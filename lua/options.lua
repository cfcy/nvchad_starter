require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- clipboard for WSL.
--vim.opt.clipboard = 'unnamedplus'
--
--if vim.fn.has('wsl') == 1 then
--    vim.g.clipboard = {
--        name = 'WslClipboard',
--        copy = {
--            ['+'] = 'clip.exe',
--            ['*'] = 'clip.exe',
--        },
--        paste = {
--            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--        },
--        cache_enabled = 0,
--    }
--end

-- set whitespaces and show it
vim.opt.listchars:append('eol:¶') -- eol:'↴'
vim.opt.listchars:append('tab:» ')
vim.opt.listchars:append('lead:·')
vim.opt.listchars:append('space:·')
vim.opt.listchars:append('trail:▫')
vim.opt.listchars:append('extends:❯')
vim.opt.listchars:append('precedes:❮')
vim.opt.listchars:append('nbsp:␣')
vim.opt.list = true
vim.opt.endofline = true

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- show margin column
vim.opt.colorcolumn = { 128 }

-- set case sensitive.
vim.opt.ignorecase = false

--show relavtive line number
vim.opt.rnu = true

-- remove trailing whitespaces on saving file.
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- disable diagnostic.
vim.diagnostic.disable()

-- force c filetype for .h header file.
autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  callback = function()
    vim.bo.filetype = "c"
  end
})
