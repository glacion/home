vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs" },
  callback = function()
    local pid = tostring(vim.fn.getpid())
    vim.lsp.start({
      name = "omnisharp",
      cmd = { "OmniSharp", "--languageserver", "--hostPID", pid },
      root_markers = { "*.sln", "*.csproj", ".git" },
    })
  end,
})
