vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nix" },
  callback = function()
    vim.lsp.start({
      cmd = { "nixd" },
      name = "nixd",
      root_markers = { "flake.lock", "flake.nix", ".git" },
    })
  end,
})
