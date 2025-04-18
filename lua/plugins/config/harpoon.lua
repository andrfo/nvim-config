-- lua/plugins/config/harpoon.lua
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Basic Harpoon keymaps
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
  { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Harpoon: Toggle menu" })

-- Navigation keymaps using leader number keys
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
  { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
  { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
  { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
  { desc = "Harpoon: Go to file 4" })

-- Navigation with Telescope (optional)
-- Requires additional setup if you want to use it
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

-- Open harpoon window in Telescope
vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
  { desc = "Harpoon: Open in Telescope" })
