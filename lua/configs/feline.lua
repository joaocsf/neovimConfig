local feline = require 'feline'

feline.setup {
  disable = {
    filetypes = {
      '^NvimTree$', '^neo%-tree$', '^dashboard$', '^Outline$', '^aerial$'
    }
  }

}
