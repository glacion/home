vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "markdown",
    "markdown.mdx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  callback = function()
    vim.lsp.start({
      cmd = { "biome", "lsp-proxy" },
      name = "biome",
      root_markers = { "biome.json", "biome.jsonc", ".git" },
    })
  end,
})
