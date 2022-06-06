local ok, cosmic_ui = pcall(require, 'cosmic-ui')
if ok then
  cosmic_ui.setup {
    -- default border toconfigs.cosmic-ui use
    -- 'single', 'double', 'rounded', 'solid', 'shadow'
    border_style = 'single',

    -- rename popup settings
    rename = {
      border = {
        highlight = 'FloatBorder',
        style = 'single',
        title = ' Rename ',
        title_align = 'left',
        title_hl = 'FloatBorder',
      },
      prompt = '> ',
      prompt_hl = 'Comment',
    },

    code_actions = {
      min_width = nil,
      border = {
        bottom_hl = 'FloatBorder',
        highlight = 'FloatBorder',
        style = 'single',
        title = 'Code Actions',
        title_align = 'center',
        title_hl = 'FloatBorder',
      },
    }
  }
end
