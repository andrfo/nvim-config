-- rustaceanvim configuration
return {
  -- Rustaceanvim options
  -- These settings will be passed to the rust-analyzer via rustaceanvim
  server = {
    settings = {
      -- rust-analyzer settings
      ['rust-analyzer'] = {
        check = {
          command = "clippy",
        },
        cargo = {
          allFeatures = false, -- Set to false to reduce duplicates
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
