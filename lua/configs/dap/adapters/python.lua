return {
  type = 'executable',
  command = os.getenv 'HOME' .. '/.virtualenvs/debugpy/bin/python',
  args = { '-m', 'debugpy.adapter' }
}
