vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  callback = function()
    vim.lsp.start({
      cmd = { "vtsls", "--stdio" },
      name = "vtsls",
      single_file_support = true,
      root_markers = {
        "tsconfig.json",
        "pnpm-lock.json",
        "package-lock.json",
        ".git",
      },
      settings = {
        javascript = {
          format = { enable = false },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = true },
          },
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierEnding = "auto",
            preferTypeOnlyAutoImports = true,
          },
        },
        typescript = {
          format = { enable = false },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = true },
          },
          preferences = {
            importModuleSpecifier = "non-relative",
            importModuleSpecifierEnding = "auto",
            preferTypeOnlyAutoImports = true,
          },
        },
      },
    })
  end,
})
