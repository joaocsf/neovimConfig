local telescope = require('helpers.telescope')

return {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = telescope.filepicker,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
}
