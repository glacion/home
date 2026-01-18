local onedarkpro = require("onedarkpro")

onedarkpro.setup({
  theme = "onedark",
  colors = require("color"),
  options = {
    bold = true,
    cursorline = true,
    italic = true,
    undercurl = true,
    underline = true,
  },
  plugins = {
    all = true,
  },
})

onedarkpro.load()
