require("neotest").setup({
  adapters = {
    require("neotest-go"),
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})

-- KEYMAP: n <leader>tn - Run nearest test
vim.keymap.set("n", "<leader>tn", function()
  require("neotest").run.run()
end)
-- KEYMAP: n <leader>tf - Run file tests
vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end)
-- KEYMAP: n <leader>ts - Toggle test summary
vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end)
