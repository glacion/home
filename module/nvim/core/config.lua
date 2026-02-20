vim.g.mapleader = ";"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.expandtab = true
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.mouse = "a"
vim.o.mousefocus = true
vim.o.mousemoveevent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.wrap = false

-- Use LSP folding if available
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    if filetype == "NvimTree" or filetype == "nvimtree" then
      return
    end
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
