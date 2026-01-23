vim.api.nvim_create_autocmd("FileType", {
  pattern = { "toml" },
  callback = function(event)
    local root_markers = { "taplo.toml", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "taplo",
      cmd = { "taplo", "lsp", "stdio" },
      root_dir = root_dir,
    })
  end,
})
