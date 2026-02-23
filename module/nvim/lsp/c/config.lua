vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp" },
  callback = function(ev)
    vim.lsp.start({
      name = "clangd",
      cmd = { "clangd" },
      root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
    })
  end,
})