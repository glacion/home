local smart_splits = require("smart-splits")

vim.keymap.set("n", "<A-h>", smart_splits.move_cursor_left)
vim.keymap.set("n", "<A-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<A-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<A-l>", smart_splits.move_cursor_right)

vim.keymap.set("n", "<A-C-h>", smart_splits.resize_left)
vim.keymap.set("n", "<A-C-j>", smart_splits.resize_down)
vim.keymap.set("n", "<A-C-k>", smart_splits.resize_up)
vim.keymap.set("n", "<A-C-l>", smart_splits.resize_right)

vim.keymap.set("n", "<A-H>", smart_splits.swap_buf_left)
vim.keymap.set("n", "<A-J>", smart_splits.swap_buf_down)
vim.keymap.set("n", "<A-K>", smart_splits.swap_buf_up)
vim.keymap.set("n", "<A-L>", smart_splits.swap_buf_right)
