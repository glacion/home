local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- KEYMAP: n <A-w> - Close current buffer
map("n", "<A-w>", "<Cmd>BufferClose<CR>", opts)
-- KEYMAP: n <A-,> - Previous buffer
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
-- KEYMAP: n <A-.> - Next buffer
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- KEYMAP: n <A-<> - Move buffer left
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- KEYMAP: n <A->> - Move buffer right
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- KEYMAP: n <C-s> - Save buffer
map("n", "<C-s>", "<Cmd>silent! write<CR>", opts)

-- Configuration
require("barbar").setup({
  animation = true,
  auto_hide = true,
  sidebar_filetypes = { NvimTree = true },
})
