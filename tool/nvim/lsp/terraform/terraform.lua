vim.api.nvim_create_autocmd("FileType", {
  pattern = { "terraform", "terraform-vars", "hcl" },
  callback = function(event)
    local root_markers = { ".terraform", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "terraform-ls",
      cmd = { "terraform-ls", "serve" },
      root_dir = root_dir,
    })
  end,
})
