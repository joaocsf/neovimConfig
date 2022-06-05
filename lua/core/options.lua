local o = vim.o
local wo = vim.wo

o.mouse = 'a'
o.guifont = 'Iosevka:h12'
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 8

wo.number = false
wo.wrap = false
wo.rnu = true
wo.nu = true
wo.cursorline = true
wo.colorcolumn = '80,120'

vim.opt.fillchars = {
  eob = ' '
}

vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

vim.api.nvim_command 'colorscheme terafox'

vim.opt_global.shortmess:remove 'F'

vim.g.timeoutlen = 500
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_cursor_vfx_particle_density = 50.0
vim.g.neovide_refresh_rate = 144
