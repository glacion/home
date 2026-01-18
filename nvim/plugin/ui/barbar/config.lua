local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keymaps
map("n", "<A-w>", "<Cmd>BufferClose<CR>", opts)
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<C-s>", "<Cmd>silent! write<CR>", opts)

-- Configuration
require("barbar").setup({
  animation = true,
  auto_hide = true,
  sidebar_filetypes = { NvimTree = true },
})
