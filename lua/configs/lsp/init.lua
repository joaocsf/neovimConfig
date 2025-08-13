local handlers = require 'configs.lsp.handlers'
handlers.setup()

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    handlers.on_attach(client, args.buf)
  end

})

local servers = require 'mason-lspconfig'.get_installed_servers()
local additional_servers = { 'ocamllsp', 'ols' }
local all_servers = vim.list_extend(servers, additional_servers)

for _, server_name in ipairs(all_servers) do
  vim.lsp.enable(server_name)
end
