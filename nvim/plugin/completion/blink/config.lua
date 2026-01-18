require("blink.cmp").setup({
  appearance = {
    highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
    use_nvim_cmp_as_default = true,
  },
  completion = {
    documentation = {
      auto_show = true,
      window = { border = "rounded" },
    },
    list = { selection = { preselect = false, auto_insert = true } },
    menu = {
      border = "rounded",
      draw = { treesitter = { "lsp" } },
    },
  },
  keymap = {
    preset = "none",

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<ESC>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },

    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },
  signature = {
    enabled = true,
    window = { border = "rounded" },
  },
  sources = {
    default = { "lsp" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- LSP Keybindings provided in blink config
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set(
      "n",
      "<leader>.",
      vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "Code actions" })
    )
    vim.keymap.set(
      "n",
      "<leader>d",
      vim.lsp.buf.definition,
      vim.tbl_extend("force", opts, { desc = "Symbol definition" })
    )
    vim.keymap.set(
      "n",
      "<leader>h",
      vim.lsp.buf.hover,
      vim.tbl_extend("force", opts, { desc = "Hover over symbol" })
    )
    vim.keymap.set(
      "n",
      "<leader>r",
      vim.lsp.buf.rename,
      vim.tbl_extend("force", opts, { desc = "Rename symbol" })
    )
    vim.keymap.set(
      "n",
      "<leader>u",
      vim.lsp.buf.references,
      vim.tbl_extend("force", opts, { desc = "Symbol usage" })
    )
  end,
})
