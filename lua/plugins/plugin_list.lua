return {
  -- oil.nvim for directory editing (replacing nvim-tree)
  {
    "stevearc/oil.nvim",
    opts = require("plugins.config.oil"),
  },
  -- lazygit integration
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gl", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
    },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "rust", "lua", "go", "terraform", "python", "markdown" },
      highlight = {
        enable = true,
      },
    },
  },


  -- telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.config.telescope"),
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fw", "<CMD>Telescope live_grep<CR>",  desc = "Live Grep" },
    },
    lazy = false,
  },
  -- Mason and LSP config
  {
    "williamboman/mason.nvim",
    config = function() require("plugins.config.lsp") end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  -- Copilot Chat integration
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    pbuild = "make tiktoken",                         -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
}
