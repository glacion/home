vim.api.nvim_create_autocmd("FileType", {
  pattern = { "bzl", "starlark" },
  callback = function(event)
    local root_markers = { ".buckconfig", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "buck2",
      cmd = { "buck2", "lsp" },
      root_dir = root_dir,
    })
  end,
})

-- Handle BUCK files and .buckconfig
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "BUCK", "TARGETS", "*.buck", "*.bzl" },
  callback = function()
    vim.bo.filetype = "bzl"
  end,
})
