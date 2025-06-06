local ok, notify = pcall(require, 'notify')

if ok then
  notify.setup {
    background_colour = 'Normal',
    merge_duplicates = true,
    fps = 30,
    icons = {
      DEBUG = '',
      ERROR = '',
      INFO = '',
      TRACE = '✎',
      WARN = ''
    },
    level = 2,
    minimum_width = 50,
    render = 'default',
    stages = 'fade_in_slide_out',
    timeout = 5000,
    top_down = false
  }
end
