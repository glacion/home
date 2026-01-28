vim.api.nvim_create_autocmd("FileType", {
  pattern = { "bzl", "starlark" },
  callback = function()
    vim.lsp.start({
      name = "buck2",
      cmd = { "buck2", "lsp" },
      root_markers = { ".buckroot" },
    })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "BUCK", "TARGETS", "*.buck", "*.bzl" },
  callback = function()
    vim.bo.filetype = "bzl"
  end,
})
