local ok, ts = pcall(require, 'nvim-treesitter')
if ok then
  ts.setup()
  vim.api.nvim_create_autocmd('FileType', {
    callback = function()
      -- syntax highlighting, provided by Neovim
      pcall(vim.treesitter.start)
      -- folds, provided by Neovim
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo.foldmethod = 'expr'
      -- indentation, provided by nvim-treesitter
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end
