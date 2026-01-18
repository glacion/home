vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  callback = function(event)
    local root_markers =
      { "tsconfig.json", "pnpm-lock.json", "package-lock.json", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers)

    if root_dir then
      vim.lsp.start({
        name = "vtsls",
        cmd = { "vtsls", "--stdio" },
        root_dir = root_dir,
        single_file_support = true,
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
    end
  end,
})
