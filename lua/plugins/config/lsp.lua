-- luacheck: globals vim

-- Create a common on_attach function to apply to all language servers
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

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

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "kotlin_language_server",
    "gopls",
    "terraformls",
    "marksman",
    -- DON'T include rust_analyzer here - rustaceanvim handles it
  },
  -- CRITICAL: Use handlers to prevent automatic setup of rust_analyzer
  handlers = {
    -- Default handler for most servers
    function(server_name)
      -- Skip rust_analyzer completely - rustaceanvim handles it
      if server_name == "rust_analyzer" then
        return -- This prevents the server from being set up
      end
      -- Set up all other servers with default config
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
      })
    end,
    -- Specific handlers for servers that need custom config
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
    end,
  }
})

-- DON'T manually set up any servers here - handlers take care of it
-- DON'T set up rust_analyzer here - rustaceanvim handles it completely
