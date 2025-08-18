return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
        settings = {
          ['rust-analyzer'] = {
            check = { command = 'clippy' },
            cargo = { allFeatures = false },
            procMacro = { enable = true },
            diagnostics = {
              enable = true,
              experimental = { enable = true },
            },
          },
        },
      },
      dap = {
        adapter = {
          type = 'executable',
          command = 'lldb-vscode',
          name = 'rt_lldb',
        },
      },
    }
  end,
}

