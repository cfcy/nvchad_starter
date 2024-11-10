local overrides = require("configs.overrides")

local plugins =  {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    'simrat39/symbols-outline.nvim',
    lazy = true,
    opts = {
      -- to customize the icons, visit https://www.nerdfonts.com/cheat-sheet
      -- and search a icon, then hover -> COPY -> Icon.
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "󰕳", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "", hl = "@type" },
        Method = { icon = "", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "", hl = "@type" },
        Interface = { icon = "", hl = "@type" },
        Function = { icon = "󰊕", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "󰅳", hl = "@string" },
        Number = { icon = "", hl = "@number" },
        Boolean = { icon = "", hl = "@boolean" },
        Array = { icon = "󰅨", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "󰌆", hl = "@type" },
        Null = { icon = "󰟢", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "", hl = "@type" },
        Event = { icon = "", hl = "@type" },
        Operator = { icon = "", hl = "@operator" },
        TypeParameter = { icon = "", hl = "@parameter" },
        Component = { icon = "󰡀", hl = "@function" },
        Fragment = { icon = "󰞤", hl = "@constant" },
      },
    },
    config = function(_, opts)
      require("symbols-outline").setup(opts)
    end,
  },

  {
    'sharkdp/fd',
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --------------------------------------------------------------------------------
  -- overrides existing plugins
  --------------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local default_opts = require("nvchad.configs.nvimtree")
      return vim.tbl_deep_extend("force", default_opts, overrides.nvimtree)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local default_opts = require("nvchad.configs.telescope")
      return vim.tbl_deep_extend("force", default_opts, overrides.telescope)
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

return plugins
