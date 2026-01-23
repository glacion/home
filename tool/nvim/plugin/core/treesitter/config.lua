-- Defer setup to ensure plugin is loaded
vim.schedule(function()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  configs.setup({
    highlight = {
      enable = true,
    },
  })
end)
