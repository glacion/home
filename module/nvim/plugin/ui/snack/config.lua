local opts = {
  dim = { enabled = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

require("snacks").setup(opts)

local map = vim.keymap.set
-- KEYMAP: n <A-f> - Smart file picker
map("n", "<A-f>", function()
  Snacks.picker.smart()
end, { desc = "Find Files" })
-- KEYMAP: n <A-g> - Grep search
map("n", "<A-g>", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
-- KEYMAP: n <leader>g - Open LazyGit
map("n", "<leader>g", function()
  Snacks.lazygit()
end, { desc = "LazyGit" })
