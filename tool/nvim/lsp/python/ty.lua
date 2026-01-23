vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function(event)
    local root_markers = { "pyproject.toml", "setup.py", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "ty",
      cmd = { "ty", "server" },
      root_dir = root_dir,
    })
  end,
})
