local ok, ts = pcall(require, 'nvim-treesitter')
if ok then
  ts.setup()
end
