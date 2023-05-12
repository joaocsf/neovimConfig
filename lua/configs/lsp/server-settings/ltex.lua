local ok, lspconfig = pcall(require, 'lspconfig')

local language_id_mapping = {
  gitcommit = 'markdown',
  vimwiki = 'markdown'
}

local opts = {
  capabilities = {
    documentHighlightProvider = false
  }
}

if ok then
  local tbl_deep_extend = vim.tbl_deep_extend
  opts = tbl_deep_extend('force', opts, {
    filetypes = { 'vimwiki', 'text', 'txt', unpack(lspconfig['ltex'].document_config.default_config.filetypes) },
    get_language_id = function(arg, filetype)
      local language_id = language_id_mapping[filetype]
      if language_id then
        return language_id
      else
        lspconfig['ltex'].document_config.default_config.get_language_id(arg, filetype)
      end
    end
  })
end

return opts
