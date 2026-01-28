local smart_splits = require("smart-splits")

-- KEYMAP: Navigation - Move cursor to window
-- KEYMAP: n <A-h> - Move to left window
vim.keymap.set("n", "<A-h>", smart_splits.move_cursor_left)
-- KEYMAP: n <A-j> - Move to down window
vim.keymap.set("n", "<A-j>", smart_splits.move_cursor_down)
-- KEYMAP: n <A-k> - Move to up window
vim.keymap.set("n", "<A-k>", smart_splits.move_cursor_up)
-- KEYMAP: n <A-l> - Move to right window
vim.keymap.set("n", "<A-l>", smart_splits.move_cursor_right)

-- KEYMAP: Resizing - Resize windows
-- KEYMAP: n <A-C-h> - Resize window left
vim.keymap.set("n", "<A-C-h>", smart_splits.resize_left)
-- KEYMAP: n <A-C-j> - Resize window down
vim.keymap.set("n", "<A-C-j>", smart_splits.resize_down)
-- KEYMAP: n <A-C-k> - Resize window up
vim.keymap.set("n", "<A-C-k>", smart_splits.resize_up)
-- KEYMAP: n <A-C-l> - Resize window right
vim.keymap.set("n", "<A-C-l>", smart_splits.resize_right)

-- KEYMAP: Swapping - Swap buffer positions
-- KEYMAP: n <A-H> - Swap buffer left
vim.keymap.set("n", "<A-H>", smart_splits.swap_buf_left)
-- KEYMAP: n <A-J> - Swap buffer down
vim.keymap.set("n", "<A-J>", smart_splits.swap_buf_down)
-- KEYMAP: n <A-K> - Swap buffer up
vim.keymap.set("n", "<A-K>", smart_splits.swap_buf_up)
-- KEYMAP: n <A-L> - Swap buffer right
vim.keymap.set("n", "<A-L>", smart_splits.swap_buf_right)
