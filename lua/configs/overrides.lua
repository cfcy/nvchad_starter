local M = {}

M.nvimtree = {
  view = {
    adaptive_size = true,
  },

  git = {
    enable = true,
  },

  filters = {
    custom = {},
    exclude = {},
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "*.o" },
  },
}

return M
