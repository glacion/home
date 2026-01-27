vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dockerfile" },
  callback = function()
    vim.lsp.start({
      cmd = { "docker-langserver", "--stdio" },
      name = "dockerls",
      root_markers = { "Dockerfile", ".git" },
      single_file_support = true,
    })
  end,
})
