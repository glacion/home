require("conform").setup({
  formatters_by_ft = {
    bash = { "shfmt" },
    buck = { "buildifier" },
    build = { "buildifier" },
    bzl = { "buildifier" },
    bxl = { "buildifier" },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    markdown = { "biome" },
    nix = { "nixfmt" },
    typescript = { "biome" },
  },
})

vim.keymap.set("", "<leader><leader>", function()
  if vim.bo.filetype == "NvimTree" then
    return
  end
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end, { desc = "Format buffer" })
