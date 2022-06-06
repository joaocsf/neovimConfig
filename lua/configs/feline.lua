local ok, feline = pcall(require, 'feline')
if ok then
  feline.setup {
    disable = {
      filetypes = {
        '^NvimTree$', '^neo%-tree$', '^dashboard$', '^Outline$', '^aerial$'
      }
    }
  }
end
