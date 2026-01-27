require("luasnip").setup({
  delete_check_events = "TextChanged",
  history = true,
})

require("luasnip.loaders.from_vscode").lazy_load()
