local opt = vim.opt
local o = vim.o
local wo = vim.wo

opt.showmode = false

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
o.wildmenu = true
o.splitbelow = true
o.splitright = true
o.signcolumn = 'yes'

wo.number = false
wo.wrap = false
wo.nu = true
wo.rnu = true
wo.cursorline = true
wo.colorcolumn = '80,120'

vim.opt.fillchars = {
  eob = ' '
}

vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 750
vim.opt.timeoutlen = 500
vim.opt_global.shortmess:remove 'F'
vim.opt.list = true
vim.opt.listchars:append 'leadmultispace:⋅│'
vim.opt.listchars:append 'tab:» '
vim.opt.listchars:append 'space:⋅'
vim.opt.listchars:append 'eol:'

vim.opt.termguicolors = true

vim.cmd 'set ls=3'
vim.cmd 'set path+=**'
vim.cmd 'syntax on'

vim.opt_global.shortmess:remove 'F'

vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_cursor_vfx_particle_density = 50.0
vim.g.neovide_refresh_rate = 144
vim.g.neovide_no_idle = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_remember_window_size = true
vim.g.mapleader = ' '

vim.cmd("packadd cfilter")
