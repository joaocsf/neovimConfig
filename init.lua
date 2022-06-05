for _, plugin in ipairs {
  'core'
} do
  local ok, err = pcall(require, plugin)

  if not ok then
    error('Failed to load ' .. plugin .. '\nError:\n' .. err .. '\n')
  end
end
