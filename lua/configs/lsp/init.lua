local lspconfig = require 'lspconfig'

local insert = table.insert
local tbl_deep_extend = vim.tbl_deep_extend
local handlers = require 'configs.lsp.handlers'
local on_attach = handlers.on_attach
handlers.setup()

local servers = {}
local lsp_installer = require 'nvim-lsp-installer'

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  insert(servers, server.name)
end

for _, server in ipairs(servers) do
  local old_on_attach = lspconfig[server].on_attach
  local opts = {
    on_attach = function(client, bufnr)
      if old_on_attach then
        old_on_attach(client, bufnr)
      end
      on_attach(client, bufnr)
    end,
    capabilities = tbl_deep_extend('force', handlers.capabilities, lspconfig[server].capabilities or {}),
  }
  local present, av_overrides = pcall(require, 'configs.lsp.server-settings.' .. server)
  if present then
    opts = tbl_deep_extend('force', av_overrides, opts)
  end

  lspconfig[server].setup(opts)
end
