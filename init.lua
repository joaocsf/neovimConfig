pcall(require, 'impatient')

local ok, err = pcall(require, 'core')

if not ok then
  error('Failed to load core \nError:\n' .. err .. '\n')
end

pcall(require, 'overrides')
