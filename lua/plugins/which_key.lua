return {
  "folke/which-key.nvim",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        local wk = require("which-key")
        local ok = pcall(wk.show, { global = false })
        if not ok then
          wk.show()
        end
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
