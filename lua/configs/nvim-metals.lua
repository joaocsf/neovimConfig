local ok, metals = pcall(require, 'metals')
if ok then

  local metals_config = metals.bare_config()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  metals_config.capabilities = require 'cmp_nvim_lsp'.update_capabilities(capabilities)
  metals_config.init_options.statusBarProvider = 'on'

  metals_config.on_attach = function(client, bufnr)
    require 'configs.lsp.handlers'.on_attach(client, bufnr)
    vim.keymap.set('n', '<leader>mws', '<cmd>lua require"metals".worksheet_hover()<cr>', { desc = 'Metals Worksheet' })
  end

  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { 'scala', 'sbt', 'java' },
    callback = function()
      metals.initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
end
