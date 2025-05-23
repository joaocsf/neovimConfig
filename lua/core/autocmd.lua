local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local group = augroup('Highlight Yank', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
  group = group,
})

group = augroup('Clear trailing spaces', { clear = true })
autocmd('BufWritePre', {
  command = ':%s#\\s\\+$##e',
  group = group,
})
autocmd('BufWritePre', {
  command = ':%s#\\($\\n\\s*\\)\\+\\%$##e',
  group = group,
})

autocmd('BufReadPost', {
  callback = function()
    if vim.fn.getfsize(vim.fn.expand '%') > 10000000 then
      vim.cmd 'syntax clear'
    end
  end
})

-- -- TODO: Temporary Fix: https://github.com/nvim-telescope/telescope.nvim/issues/2027
-- autocmd('WinLeave', {
--   callback = function()
--     if vim.bo.ft == 'TelescopePrompt' and vim.fn.mode() == 'i' then
--       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'i', false)
--     end
--   end,
-- })
