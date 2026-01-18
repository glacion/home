require("neotest").setup({
  adapters = {
    require("neotest-go"),
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})

vim.keymap.set("n", "<leader>tn", function()
  require("neotest").run.run()
end)
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end)
