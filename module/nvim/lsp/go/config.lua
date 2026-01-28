vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gowork" },
  callback = function()
    vim.lsp.start({
      name = "gopls",
      cmd = { "gopls" },
      root_markers = { "go.work", "go.mod", ".git" },
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })
  end,
})
