local dap = require("dap")

-- KEYMAP: n <F5> - Continue debug
vim.keymap.set("n", "<F5>", dap.continue)
-- KEYMAP: n <F10> - Step over
vim.keymap.set("n", "<F10>", dap.step_over)
-- KEYMAP: n <F11> - Step into
vim.keymap.set("n", "<F11>", dap.step_into)
-- KEYMAP: n <F12> - Step out
vim.keymap.set("n", "<F12>", dap.step_out)
-- KEYMAP: n <leader>b - Toggle breakpoint
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
-- KEYMAP: n <leader>B - Conditional breakpoint
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
