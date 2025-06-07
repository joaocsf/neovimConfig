local ok, ts = pcall(require, 'nvim-treesitter')
if ok then
  ts.setup()

  vim.api.nvim_command ':TSEnable highlight'
  vim.api.nvim_command ':TSEnable rainbow'
end
