local ok, ts = pcall(require, 'nvim-treesitter')
if ok then
  ts.setup {
    highlight = {
      enable = true
    }
  }

  vim.api.nvim_command ':TSEnable highlight'
end

