vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "bash", "zsh" },
  callback = function()
    vim.lsp.start({
      cmd = { "bash-language-server", "start" },
      name = "bashls",
      root_markers = { ".git", ".bashrc", ".bash_profile" },
    })
  end,
})
