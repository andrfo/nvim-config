-- luacheck: globals vim
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "kotlin_language_server",
    "gopls",
    "terraformls",
    "marksman",
  },
})

local lspconfig = require("lspconfig")


-- Setup other language servers
lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})

lspconfig.pyright.setup({})

lspconfig.terraformls.setup({
  on_attach = function(client, bufnr)
    -- Optional Terraform-specific keymaps/settings
  end,
})

lspconfig.kotlin_language_server.setup({
  on_attach = function(client, bufnr)
    -- Optional Kotlin-specific keymaps/settings
  end,
})

lspconfig.gopls.setup({})

lspconfig.marksman.setup({})
