local ok_dap, dap = pcall(require, 'dap')

if ok_dap then
  dap.configurations = vim.tbl_deep_extend('force', dap.configurations or {}, require 'configs.dap.configurations')
  dap.adapters = vim.tbl_deep_extend('force', dap.adapters or {}, require 'configs.dap.adapters')
end
