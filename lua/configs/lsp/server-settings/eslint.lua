return {
  on_attach = function(client, buffnr)
    local autocmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup

    local group = augroup('Auto Fix on Save', { clear = true })
    autocmd('BufWritePre', {
      command = 'EslintFixAll',
      group = group,
    })
  end
}
