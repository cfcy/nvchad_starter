-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.base46 = {
	theme = "solarized_dark",

    hl_override = {
        Comment = { italic = false, },
        Type = { fg = "green", },
        StorageClass = { fg = "cyan", },
        Label = { fg = "red", },
        ["@comment"] = { italic = false },
        ["@punctuation.bracket"] = { fg = "pink", },
        ["@punctuation.delimiter"] = { fg = "#93a1a1", },
        ["@keyword"] = { fg = "cyan", },
        ["@parameter"] = { fg = "#93a1a1", },
        ["@property"] = { fg = "#93a1a1", },
        ["@string"] = { fg = "light_grey", },
        ["@type.builtin"] = { fg = "cyan", },
        ["@character"] = { fg = "teal", },
        ["@constant"] = { fg = "teal", },
        ["@constant.macro"] = { fg = "teal", },
    },

    hl_add =  {
        NvimTreeOpenedFolderName = { fg = "green", bold = true },
    },
}

M.ui = {
    statusline = {
        -- theme = "default",
        order = { "mode", "relativepath", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
        modules = {
            relativepath = function()
                local path = vim.api.nvim_buf_get_name(stbufnr())

                if path == "" then
                    return ""
                end

                return "./" .. vim.fn.expand("%:.")
            end,
        },
    },
}

return M
