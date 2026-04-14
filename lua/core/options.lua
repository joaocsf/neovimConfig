vim.o.mouse = 'a'
vim.o.guifont = 'Iosevka:h12'
vim.o.swapfile = true
vim.o.dir = '/tmp'
vim.o.smartcase = true
vim.o.laststatus = 2
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 8
vim.o.wildmenu = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.signcolumn = 'yes'

vim.wo.number = false
vim.wo.wrap = false
vim.wo.nu = true
vim.wo.rnu = true
vim.wo.cursorline = true
vim.wo.colorcolumn = '80,120'

vim.opt.fillchars = {
  eob = ' '
}

vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 750
vim.opt.timeoutlen = 500
vim.opt.list = true
vim.opt.listchars:append 'leadmultispace:⋅│'
vim.opt.listchars:append 'tab:» '
vim.opt.listchars:append 'space:⋅'
vim.opt.listchars:append 'eol:▾'
vim.opt.modeline = false
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
vim.g.maplocalleader = ' '
