function Path_Sources(path)
  local paths = {}
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/' .. path, [[v:val =~ '\.lua$']])) do
    local file_name = file:gsub('%.lua', '')
    table.insert(paths, file_name)
  end
  return paths
end
