vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "eruby" },
  callback = function()
    vim.lsp.start({
      name = "ruby_lsp",
      cmd = { "ruby-lsp" },
      root_markers = { "Gemfile", ".git" },
    })
  end,
})
