-- rustaceanvim configuration
return {
  -- Rustaceanvim options
  -- These settings will be passed to the rust-analyzer via rustaceanvim
  server = {
    on_attach = function(client, bufnr)
      -- Import the default on_attach function from lsp.lua
      local lsp_on_attach = require("lsp").on_attach
      if lsp_on_attach then
        lsp_on_attach(client, bufnr)
      end

      -- Rust-specific keymaps (these will override the global ones)
      vim.keymap.set(
        "n",
        "<leader>ca",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        end,
        { silent = true, buffer = bufnr }
      )

      vim.keymap.set(
        "n",
        "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function()
          vim.cmd.RustLsp({ 'hover', 'actions' })
        end,
        { silent = true, buffer = bufnr }
      )
    end,
    settings = {
      -- rust-analyzer settings
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy",
        },
        cargo = {
          allFeatures = true,
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
  -- DAP configuration (for debugging)
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}
