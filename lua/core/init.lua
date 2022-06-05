for _, plugin in ipairs {
  'core.plugins',
  'core.options',
  'core.keymaps',
  'core.autocmd',
} do
  local ok, err = pcall(require, plugin)

  if not ok then
    error('Failed to load ' .. plugin .. '\nError:\n' .. err .. '\n')
  end
end
