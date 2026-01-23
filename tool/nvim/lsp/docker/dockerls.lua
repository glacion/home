vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dockerfile" },
  callback = function(event)
    local root_markers = { "Dockerfile", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "dockerls",
      cmd = { "docker-langserver", "--stdio" },
      root_dir = root_dir,
    })
  end,
})
