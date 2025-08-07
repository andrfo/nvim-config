return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other plugins
    config = function()
      local tokyonight = require("plugins.config.colorscheme").tokyonight
      require("tokyonight").setup(tokyonight)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      -- Use leader / for toggling comments
      mappings = {
        basic = false,
        extra = false,
      },
    },
    keys = {
      { "<leader>/", function() require("Comment.api").toggle.linewise.current() end,                 desc = "Toggle comment" },
      { "<leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "x",             desc = "Toggle comment" },
    },
  },

  -- Add this to your lua/plugins/plugin_list.lua file
  -- Insert this entry in the return {} block

  -- Harpoon for quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.config.harpoon")
    end,
  },

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
      indent = {
        enable = true,
      },
    },
  },

  -- telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.config.telescope"),
    -- Keys are now defined in keymaps.lua
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
      {
        "github/copilot.vim",
        config = function()
          -- Disable Copilot suggestions and autocomplete
          vim.g.copilot_enabled = false
          vim.g.copilot_no_tab_map = true
          vim.g.copilot_assume_mapped = true
          vim.g.copilot_tab_fallback = ""
        end,
      },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = require("plugins.config.copilot_chat"),
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    {
      "saecki/crates.nvim",
      tag = "stable",
      event = { "BufRead Cargo.toml" },
      config = function()
        local crates = require("crates")
        crates.setup({
          lsp = {
            enabled = true,
            actions = true,
            completion = true,
            hover = true,
          },
          completion = {
            cmp = {
              enabled = true,
            },
          },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show Crate Features" })
      end,
    },
  },
{
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ['rust-analyzer'] = {
            check = {
              command = "clippy",
            },
            cargo = {
              allFeatures = false,
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      },
      dap = {
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "rt_lldb",
        },
      },
    }
  end,
},
  {
	"OXY2DEV/markview.nvim",
	opts = {},
        lazy = true, -- set to false to load on startup (recommended)
	ft = "markdown", -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",

		"nvim-tree/nvim-web-devicons",
	},
},
  -- Add completion plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- LuaSnip and its dependencies
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets", -- Collection of snippets for many languages
    },
    config = function()
      -- Initialize luasnip with vscode-style snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Optional: Enable filetype snippets
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("typescript", { "typescriptreact" })
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip").filetype_extend("rust", { "rustacean" })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
