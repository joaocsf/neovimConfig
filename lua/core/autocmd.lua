local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local group = augroup('Highlight Yank', {clear = true})
autocmd('TextYankPost', {
  callback = function()
    require'vim.highlight'.on_yank{ higroup = 'IncSearch', timeout=200}
  end,
  group = group
})

group = augroup('Clear trailing spaces', {clear = true})
autocmd('BufWritePre', {
  command = ':%s#\\s\\+$##e',
  group = group
})
autocmd('BufWritePre', {
  command = ':%s#\\($\\n\\s*\\)\\+\\%$##e',
  group = group
})
