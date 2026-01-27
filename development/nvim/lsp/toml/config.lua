vim.api.nvim_create_autocmd("FileType", {
  pattern = { "toml" },
  callback = function()
    vim.lsp.start({
      name = "taplo",
      cmd = { "taplo", "lsp", "stdio" },
      root_markers = { "taplo.toml", ".git" },
      single_file_support = true,
    })
  end,
})
