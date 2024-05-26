for _, plugin in ipairs {
  'core.bootstrap',
  'core.options',
  'core.plugins',
  'core.post-plugin',
  'core.keymaps',
  'core.autocmd',
} do
  local ok, err = pcall(require, plugin)

  if not ok then
    error('Failed to load ' .. plugin .. '\nError:\n' .. err .. '\n')
  end
end
