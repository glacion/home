-- KEYMAP: n <A-n> - Toggle file tree
vim.keymap.set(
  "n",
  "<A-n>",
  "<cmd>NvimTreeToggle<cr>",
  { desc = "File Explorer", noremap = true, silent = true }
)

-- Configuration
require("nvim-tree").setup({
  select_prompts = true,
  sync_root_with_cwd = true, -- Replaces deprecated `update_cwd`
  actions = {
    change_dir = {
      global = true,
    },
  },
  diagnostics = {
    enable = false,
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    group_empty = true,
  },
})
