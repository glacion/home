vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.lsp.start({
      cmd = { "ty", "server" },
      name = "ty",
      root_markers = { "pyproject.toml", "setup.py", ".git" },
    })
  end,
})
