-- luacheck: globals vim
local opts = { noremap = true, silent = true }

-- Map <leader>e to open oil.nvim (your file explorer)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", opts)

-- Insert mode cursor movement with Ctrl+hjkl
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)

-- Modified visual mode paste to not overwrite the register
-- This uses the black hole register "_" to discard the selected text
vim.keymap.set("v", "p", '"_dP', { noremap = true, desc = "Paste without overwriting register" })

-- Clipboard handling mappings for macOS
-- Paste from system clipboard with Cmd+v
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { noremap = true, desc = "Paste from system clipboard" })
vim.keymap.set("i", "<D-v>", '<C-r>+', { noremap = true, desc = "Paste from system clipboard in insert mode" })

-- LSP keymaps (moved from per-buffer to global with conditional checks)
local function has_lsp()
  local clients = vim.lsp.get_clients and vim.lsp.get_clients({ buf = 0 })
      or vim.lsp.buf_get_clients(0)
  return next(clients) ~= nil
end

local function with_lsp(fn)
  return function(...)
    if has_lsp() then
      return fn(...)
    else
      vim.notify("LSP not attached", vim.log.levels.WARN)
    end
  end
end

vim.keymap.set("n", "gd", with_lsp(vim.lsp.buf.definition),
  { noremap = true, silent = true, desc = "Go to Definition" })

-- Add more common LSP keybindings
vim.keymap.set("n", "gr", with_lsp(vim.lsp.buf.references),
  { noremap = true, silent = true, desc = "Go to References" })

vim.keymap.set("n", "K", with_lsp(vim.lsp.buf.hover),
  { noremap = true, silent = true, desc = "Hover Documentation" })

vim.keymap.set("n", "<leader>ca", with_lsp(vim.lsp.buf.code_action),
  { noremap = true, silent = true, desc = "Code Action" })

vim.keymap.set("n", "<leader>ra", with_lsp(vim.lsp.buf.rename),
  { noremap = true, silent = true, desc = "Rename" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float,
  { noremap = true, silent = true, desc = "Open Diagnostic" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
  { noremap = true, silent = true, desc = "Previous Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
  { noremap = true, silent = true, desc = "Next Diagnostic" })

-- Telescope keymaps (moved from plugin_list.lua for better organization)
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>",
  { noremap = true, silent = true, desc = "Find Files" })
vim.keymap.set("n", "<leader>fw", "<CMD>Telescope live_grep<CR>",
  { noremap = true, silent = true, desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>",
  { noremap = true, silent = true, desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>",
  { noremap = true, silent = true, desc = "Help Tags" })
