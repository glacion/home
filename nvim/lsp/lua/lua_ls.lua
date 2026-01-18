vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function(event)
    local root_markers = { ".luarc.json", ".luarc.jsonc", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "lua_ls",
      cmd = { "lua-language-server" },
      root_dir = root_dir,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
})
