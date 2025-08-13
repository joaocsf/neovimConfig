local map = vim.keymap.set

local ok, metals = pcall(require, 'metals')
if ok then
  local metals_config = metals.bare_config()

  metals_config.settings = {
    inlayHints = {
      hintsInPatternMatch = { enable = true },
      implicitArguments = { enable = true },
      implicitConversions = { enable = true },
      inferredTypes = { enable = true },
      typeParameters = { enable = true },
    },
  }

  metals_config.init_options.statusBarProvider = 'on'

  metals_config.on_attach = function(client, bufnr)
    metals.setup_dap()
    require 'configs.lsp.handlers'.on_attach(client, bufnr)
    vim.keymap.set('n', '<leader>mh', '<cmd>lua require"metals".hover_worksheet()<cr>',
      { desc = 'Metals Hover Worksheet' })
    map('n', '<leader>lm', function()
      local ok_telescope, telescope = pcall(require, 'telescope')
      if ok_telescope then
        telescope.extensions.metals.commands()
      end
    end, { desc = 'Metals Commands' })
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
