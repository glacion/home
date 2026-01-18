vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  callback = function(event)
    local root_markers = { "biome.json", "biome.jsonc" }
    local root_dir = vim.fs.root(event.buf, root_markers)

    -- Only start Biome if a config file is found, to avoid conflict with other linters/formatters?
    -- The user requested enabling it, so I'll be permissive but prefer root_dir.
    if not root_dir then
      root_dir = vim.fs.root(event.buf, { "package.json", ".git" })
        or vim.fn.getcwd()
    end

    vim.lsp.start({
      name = "biome",
      cmd = { "biome", "lsp-proxy" },
      root_dir = root_dir,
    })
  end,
})
