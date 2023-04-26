local ok, mason = pcall(require, 'mason')

if ok then
  mason.setup()
  require 'mason-lspconfig'.setup {
    ensure_installed = { 'lua_ls' }
  }
  require 'mason-nvim-dap'.setup()

  print 'requiring lsp'
  require 'configs.lsp'
end
