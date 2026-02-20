local ignored_filetypes = {
  NvimTree = true,
  nvimtree = true,
}

local function is_ignored_filetype(bufnr)
  return ignored_filetypes[vim.bo[bufnr].filetype] == true
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "nvimtree" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    if is_ignored_filetype(event.buf) then
      vim.diagnostic.enable(false, { bufnr = event.buf })
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client then
        vim.lsp.buf_detach_client(event.buf, client.id)
      end
      return
    end
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})
