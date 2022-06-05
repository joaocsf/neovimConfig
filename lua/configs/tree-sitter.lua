require'nvim-treesitter'.setup{
  highlight = {
    enable = true
  }
}

vim.api.nvim_command(':TSEnable highlight')
