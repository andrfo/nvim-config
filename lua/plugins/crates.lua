return {
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

    vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show Crate Features" })
  end,
}

