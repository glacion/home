vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.lsp.start({
      cmd = { "ruff", "server" },
      name = "ruff",
      root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    })
  end,
})
