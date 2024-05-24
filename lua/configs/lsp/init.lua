local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
  local tbl_deep_extend = vim.tbl_deep_extend
  local handlers = require 'configs.lsp.handlers'
  handlers.setup()

  local servers = require 'mason-lspconfig'.get_installed_servers()
  local additional_servers = { 'ocamllsp', 'ols' }
  local all_servers = vim.list_extend(servers, additional_servers)

  for _, server_name in ipairs(all_servers) do
    local has_overrides, overrides = pcall(require, 'configs.lsp.server-settings.' .. server_name)

    local old_on_attach = lspconfig[server_name].on_attach

    local opts = {
      on_attach = function(client, bufnr)
        if old_on_attach then
          old_on_attach(client, bufnr)
        end
        handlers.on_attach(client, bufnr)
        if has_overrides and overrides.on_attach then
          overrides.on_attach(client, bufnr)
        end
      end,
      capabilities = tbl_deep_extend('force', handlers.capabilities, lspconfig[server_name].capabilities or {}),
    }

    local ok_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
    if ok_cmp then
      local capabilities = cmp.default_capabilities()
      opts.capabilities = tbl_deep_extend('force', capabilities, opts.capabilities)
    end

    if has_overrides then
      opts = tbl_deep_extend('force', opts, overrides)
    end

    lspconfig[server_name].setup(opts)
  end
end
