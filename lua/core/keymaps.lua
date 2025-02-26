-- luacheck: globals vim
local opts = { noremap = true, silent = true }

-- Map <leader>e to open oil.nvim (your file explorer)
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition,
  { noremap = true, silent = true, buffer = bufnr, desc = "Go to Definition" })
