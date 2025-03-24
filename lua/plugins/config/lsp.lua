-- luacheck: globals vim
local M = {}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "kotlin_language_server",
    "gopls",
    "terraformls",
    "marksman",
    "rust_analyzer", -- Add rust_analyzer to ensure it's installed
  },
})

local lspconfig = require("lspconfig")

-- Create a common on_attach function to apply to all language servers
M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- If we want buffer-local versions of these (in addition to the global ones in keymaps.lua)
  -- This ensures the commands work even before the global keymaps are loaded
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

  -- Set up autoformatting on save if the server supports it
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- Setup other language servers
lspconfig.lua_ls.setup({
  on_attach = M.on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lspconfig.pyright.setup({
  on_attach = M.on_attach,
})

lspconfig.terraformls.setup({
  on_attach = M.on_attach,
})

lspconfig.kotlin_language_server.setup({
  on_attach = M.on_attach,
})

lspconfig.gopls.setup({
  on_attach = M.on_attach,
})

lspconfig.marksman.setup({
  on_attach = M.on_attach,
})

-- Don't set up rust_analyzer here since it's handled by rustaceanvim

return M
