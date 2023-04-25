local ok, dashboard = pcall(require, 'dashboard')

if ok then
  dashboard.setup {
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      shortcut = {
        {
          icon = '  ',
          desc = 'Update',
          group = '@property',
          action = 'PackerSync',
          key = 'u'
        },
        {
          icon = '  ',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          icon = '  ',
          desc = 'Wiki',
          group = 'Text',
          action = 'VimwikiIndex',
          key = 'w',
        }
      },
    },
  }
end
