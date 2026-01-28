vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terraform", "terraform-vars", "hcl" },
  callback = function()
    vim.lsp.start({
      cmd = { "terraform-ls", "serve" },
      name = "terraform-ls",
      root_markers = { ".terraform", ".git" },
    })
  end,
})
