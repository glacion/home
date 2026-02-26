require("conform").setup({
  formatters_by_ft = {
    bash = { "shfmt" },
    buck = { "buildifier" },
    build = { "buildifier" },
    bzl = { "buildifier" },
    bxl = { "buildifier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    cs = { "csharpier" },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    markdown = { "biome" },
    nix = { "nixfmt" },
    ruby = { "rubyfmt" },
    typescript = { "biome" },
  },
})

-- KEYMAP: n/v <leader><leader> - Format buffer
vim.keymap.set("", "<leader><leader>", function()
  local filetype = vim.bo.filetype
  if filetype == "NvimTree" or filetype == "nvimtree" then
    return
  end
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end, { desc = "Format buffer" })
