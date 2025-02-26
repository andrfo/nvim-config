-- Configuration for copilot-chat
return {
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
    -- These are global mappings for CopilotChat
    open = {
      normal = "<leader>cc",
      insert = "<C-c>c",
    },
    close = {
      normal = "q",
      insert = "<C-c>q",
    },
    reset = {
      normal = "<leader>cr",
      insert = "<C-c>r",
    },
    -- Quick prompts
    prompt_actions = {
      explain = {
        normal = "<leader>ce",
        insert = "<C-c>e",
      },
      fix = {
        normal = "<leader>cf",
        insert = "<C-c>f",
      },
      optimize = {
        normal = "<leader>co",
        insert = "<C-c>o",
      },
      tests = {
        normal = "<leader>ct",
        insert = "<C-c>t",
      },
    },
  },
  prompts = {
    -- Customize default prompts or add your own
    Explain = "Explain how this code works in detail: ```$text```",
    Fix = "Fix the following code: ```$text```",
    Optimize = "Optimize the following code: ```$text```",
    Tests = "Generate comprehensive tests for the following code: ```$text```",
  },
}
