local ok, toggleterm = pcall(require, 'toggleterm')
if ok then
  toggleterm.setup {
    size = 10,
    shading_factor = 2,
    direction = 'float',
    float_opts = {
      border = 'curved',
      highlights = {
        border = 'Normal',
        background = 'Normal'
      }
    }
  }
end
