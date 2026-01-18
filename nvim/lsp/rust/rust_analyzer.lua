vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function(event)
    local root_markers = { "Cargo.toml", "rust-project.json", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers)

    if root_dir then
      vim.lsp.start({
        name = "rust_analyzer",
        cmd = { "rust-analyzer" },
        root_dir = root_dir,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
    end
  end,
})
