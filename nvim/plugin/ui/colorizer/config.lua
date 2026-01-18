require("colorizer").setup({
  user_default_options = {
    names = false, -- Disable color names like "Blue"
    mode = "background", -- Set the display mode
    tailwind = true, -- Enable tailwind colors
    sass = { enable = true, parsers = { "css" } },
    virtualtext = "■",
  },
})
