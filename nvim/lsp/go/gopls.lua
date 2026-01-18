vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gowork" },
  callback = function(event)
    local root_markers = { "go.work", "go.mod", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers)

    if root_dir then
      vim.lsp.start({
        name = "gopls",
        cmd = { "gopls" },
        root_dir = root_dir,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
    end
  end,
})
