vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    if vim.bo[event.buf].filetype == "NvimTree" then
      return
    end
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})
