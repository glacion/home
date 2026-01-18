require("mini.move").setup({
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = "",
    right = "",
    down = "<C-j>",
    up = "<C-k>",

    -- Move current line in Normal mode
    line_left = "",
    line_right = "",
    line_down = "<C-j>",
    line_up = "<C-k>",
  },

  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
})
