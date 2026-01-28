require("noice").setup({
  notify = { view = "mini" },
  views = {
    mini = { position = { col = -1, row = -1 } },
  },
  messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "mini",
    view_search = "mini",
  },
  lsp = {
    message = { view = "mini" },
    progress = { enabled = false },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    command_palette = true,
    long_message_to_split = true,
  },
})
