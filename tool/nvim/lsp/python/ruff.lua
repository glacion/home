vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function(event)
    local root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers)

    if root_dir then
      vim.lsp.start({
        name = "ruff",
        cmd = { "ruff", "server" },
        root_dir = root_dir,
      })
    end
  end,
})
