return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    {
      "github/copilot.vim",
      config = function()
        vim.g.copilot_enabled = false
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
      end,
    },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        accept = "<CR>",
        next_item = "<C-n>",
        prev_item = "<C-p>",
      },
      size = {
        width = 50,
        height = 15,
      },
    },
    mappings = {
      open = { normal = "<leader>cc", insert = "<C-c>c" },
      close = { normal = "q", insert = "<C-c>q" },
      reset = { normal = "<leader>cr", insert = "<C-c>r" },
      prompt_actions = {
        explain = { normal = "<leader>ce", insert = "<C-c>e" },
        fix = { normal = "<leader>cf", insert = "<C-c>f" },
        optimize = { normal = "<leader>co", insert = "<C-c>o" },
        tests = { normal = "<leader>ct", insert = "<C-c>t" },
      },
    },
    prompts = {
      Explain = "Explain how this code works in detail: ```$text```",
      Fix = "Fix the following code: ```$text```",
      Optimize = "Optimize the following code: ```$text```",
      Tests = "Generate comprehensive tests for the following code: ```$text```",
    },
  },
}

