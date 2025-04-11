local ok, bufferline = pcall(require, 'bufferline')
if ok then
  bufferline.setup {
    options = {
      mode = 'buffers',
      offsets = {
        { filetype = 'NvimTree', text = '', padding = 1 },
        { filetype = 'neo-tree', text = '', padding = 1 },
        { filetype = 'Outline',  text = '', padding = 1 },
      },
      buffer_close_icon = '⨯',
      modified_icon = '',
      close_icon = '⨯',
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      separator_style = 'thin',
      show_tab_indicators = true,
      enforce_regular_tabs = true
    },
  }
end
