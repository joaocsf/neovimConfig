local ok, lspconfig = pcall(require, 'lspconfig')


local opts = {
  capabilities = {
    documentHighlightProvider = false
  }
}

if ok then
  local tbl_deep_extend = vim.tbl_deep_extend
  tbl_deep_extend('force', opts, {
    filetypes = { 'vimwiki', 'text', 'txt', unpack(lspconfig['ltex'].filetypes) }
  })
end

return opts
