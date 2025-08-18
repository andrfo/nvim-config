return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      server = {
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

