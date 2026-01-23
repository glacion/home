vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash" },
  callback = function(event)
    local root_markers = { ".git", ".bashrc", ".bash_profile" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "bashls",
      cmd = { "bash-language-server", "start" },
      root_dir = root_dir,
    })
  end,
})
