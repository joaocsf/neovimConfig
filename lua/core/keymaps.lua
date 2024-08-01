-- keymaps
local map = vim.keymap.set

local function get_visual_selection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

vim.g.mapleader = ' '

-- Trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>',
  { silent = true, noremap = true, desc = 'Trouble Toggle' }
)
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>',
  { silent = true, noremap = true, desc = 'Trouble Workspace Diagnostics' }
)
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',
  { silent = true, noremap = true, desc = 'Trouble Document Diagnostics' }
)
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>',
  { silent = true, noremap = true, desc = 'Trouble LocList' }
)
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>',
  { silent = true, noremap = true, desc = 'Trouble QuickFix' }
)
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>',
  { silent = true, noremap = true, desc = 'Trouble LSP References' }
)

-- NVim-Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'NvimTree Toggle' })
map('n', '<leader>o', '<cmd>NvimTreeFocus<cr>',  { desc = 'NvimTree Focus' })

-- Buffers
-- bufferdelete
map('n', '<leader>q',  '<cmd>Bdelete<cr>',                             { desc = 'Close buffer' })
map('n', '<leader>ca', '<cmd>w <bar> %bd <bar> e# <bar> bd# <cr><cr>', { desc = 'Close all buffers' })

-- bufferline
map('n', '<S-k>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer tab' })
map('n', '<S-j>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer tab' })
map('n', '>b',    '<cmd>BufferLineMoveNext<cr>',  { desc = 'Move buffer tab right' })
map('n', '<b',    '<cmd>BufferLineMovePrev<cr>',  { desc = 'Move buffer tab left' })
map('n', '<S-l>', '<cmd>BufferLineMoveNext<cr>',  { desc = 'Move buffer tab right' })
map('n', '<S-h>', '<cmd>BufferLineMovePrev<cr>',  { desc = 'Move buffer tab left' })

-- Smart Splits
-- Better window navigation
map('n', '<C-h>', function()
  require 'smart-splits'.move_cursor_left()
end, { desc = 'Move to left split' })
map('n', '<C-j>', function()
  require 'smart-splits'.move_cursor_down()
end, { desc = 'Move to below split' })
map('n', '<C-k>', function()
  require 'smart-splits'.move_cursor_up()
end, { desc = 'Move to above split' })
map('n', '<C-l>', function()
  require 'smart-splits'.move_cursor_right()
end, { desc = 'Move to right split' })

-- Resize with arrows
map('n', '<C-Up>', function()
  require 'smart-splits'.resize_up()
end, { desc = 'Resize split up' })
map('n', '<C-Down>', function()
  require 'smart-splits'.resize_down()
end, { desc = 'Resize split down' })
map('n', '<C-Left>', function()
  require 'smart-splits'.resize_left()
end, { desc = 'Resize split left' })
map('n', '<C-Right>', function()
  require 'smart-splits'.resize_right()
end, { desc = 'Resize split right' })

-- Harpoon
map('n', '<leader>ha', function()
  require 'harpoon.mark'.add_file()
end, { desc = 'Harpoon Add File' })
map('n', '<leader>hh', function()
  require 'harpoon.ui'.toggle_quick_menu()
end, { desc = 'Harpoon List Marks' })
map('n', '<leader>hj', function()
  require 'harpoon.ui'.nav_file(1)
end, { desc = 'Harpoon Navigate 1' })
map('n', '<leader>hk', function()
  require 'harpoon.ui'.nav_file(2)
end, { desc = 'Harpoon Navigate 2' })
map('n', '<leader>hl', function()
  require 'harpoon.ui'.nav_file(3)
end, { desc = 'Harpoon Navigate 3' })
map('n', '<leader>h;', function()
  require 'harpoon.ui'.nav_file(4)
end, { desc = 'Harpoon Navigate 4' })
map('n', '<M-a>', function()
  require 'harpoon.ui'.nav_file(1)
end, { desc = 'Harpoon Navigate 15' })
map('n', '<M-s>', function()
  require 'harpoon.ui'.nav_file(2)
end, { desc = 'Harpoon Navigate 2' })
map('n', '<M-d>', function()
  require 'harpoon.ui'.nav_file(3)
end, { desc = 'Harpoon Navigate 3' })
map('n', '<M-f>', function()
  require 'harpoon.ui'.nav_file(4)
end, { desc = 'Harpoon Navigate 4' })
map('n', '<M-g>', function()
  require 'harpoon.ui'.nav_file(5)
end, { desc = 'Harpoon Navigate 5' })

-- Diffview
map('n', '<leader>ga',
  '<cmd>DiffviewOpen<cr>',
  { desc = 'Git Diff View' })
map('n', '<leader>gq',
  '<cmd>DiffviewClose<cr>',
  { desc = 'Git Diff Close' })
map('n', '<leader>gf',
  '<cmd>DiffviewFileHistory<cr>',
  { desc = 'Git Diff History' })

-- Telescope
map('v', '<leader>f', function()
  local charactersToEscape = '([%[%]%{%}%(%)\\|])'
  local text = get_visual_selection():gsub(charactersToEscape, '\\%1')
  require 'telescope'.extensions.live_grep_args.live_grep_args { default_text = text }
end, { desc = 'Search Selection' })
map('n', '<leader>fw', function()
  require 'telescope'.extensions.live_grep_args.live_grep_args()
end, { desc = 'Search words' })
map('n', '<leader>gt', function()
  require 'telescope.builtin'.git_status()
end, { desc = 'Git Status' })
map('n', '<leader>gb', function()
  require 'telescope.builtin'.git_branches()
end, { desc = 'Git branchs' })
map('n', '<leader>gc', function()
  require 'telescope.builtin'.git_commits()
end, { desc = 'Git commits' })
map('n', '<leader>ff', function()
  require 'telescope.builtin'.find_files()
end, { desc = 'Search files' })
map('n', '<leader>fr', function()
  require 'telescope.builtin'.resume()
end, { desc = 'Search Resume' })
map('n', '<leader>fb', function()
  require 'telescope.builtin'.buffers()
end, { desc = 'Search buffers' })
map('n', '<leader>fh', function()
  require 'telescope.builtin'.help_tags()
end, { desc = 'Search help' })
map('n', '<leader>fm', function()
  require 'telescope.builtin'.marks()
end, { desc = 'Search marks' })
map('n', '<leader>fo', function()
  require 'telescope.builtin'.oldfiles()
end, { desc = 'Search history' })
map('n', '<leader>sb', function()
  require 'telescope.builtin'.git_branches()
end, { desc = 'Git branchs' })
map('n', '<leader>sh', function()
  require 'telescope.builtin'.help_tags()
end, { desc = 'Search help' })
map('n', '<leader>sm', function()
  require 'telescope.builtin'.man_pages()
end, { desc = 'Search man' })
map('n', '<leader>sn', function()
  require 'telescope'.extensions.notify.notify()
end, { desc = 'Search notifications' })
map('n', '<leader>sr', function()
  require 'telescope.builtin'.registers()
end, { desc = 'Search registers' })
map('n', '<leader>sk', function()
  require 'telescope.builtin'.keymaps()
end, { desc = 'Search keymaps' })
map('n', '<leader>sc', function()
  require 'telescope.builtin'.commands()
end, { desc = 'Search commands' })
map('n', '<leader>ss', function()
  require 'telescope.builtin'.symbols()
end, { desc = 'Search symbols' })
map('n', '<leader>la', function()
  vim.lsp.buf.code_action()
end, { desc = 'LSP code action' })
map('n', '<leader>ls', function()
  local aerial_avail, _ = pcall(require, 'aerial')
  if aerial_avail then
    require 'telescope'.extensions.aerial.aerial()
  else
    require 'telescope.builtin'.lsp_document_symbols()
  end
end, { desc = 'Search symbols' })
map('n', '<leader>lR', function()
  require 'telescope.builtin'.lsp_references()
end, { desc = 'Search references' })
map('n', '<leader>lD', function()
  require 'telescope.builtin'.diagnostics()
end, { desc = 'Search diagnostics' })
map('n', '<leader>lI', function()
  require 'telescope.builtin'.lsp_incoming_calls()
end, { desc = 'Incoming calls' })
map('n', '<leader>lO', function()
  require 'telescope.builtin'.lsp_outgoing_calls()
end, { desc = 'Outgoing calls' })

-- Toggle Term
-- Lazygit
map('n', '<leader>gg', function()
  require 'helpers.term'.lazygit_toggle()
end, { desc = 'Lazygit' })

--Toggle Term
map('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })

-- Git Signs
map('n', '<leader>gj', function()
  require 'gitsigns'.next_hunk()
end, { desc = 'Next git hunk' })
map('n', '<leader>gk', function()
  require 'gitsigns'.prev_hunk()
end, { desc = 'Previous git hunk' })
map('n', '<leader>gl', function()
  require 'gitsigns'.blame_line()
end, { desc = 'View git blame' })
map('n', '<leader>gp', function()
  require 'gitsigns'.preview_hunk()
end, { desc = 'Preview git hunk' })
map('n', '<leader>gh', function()
  require 'gitsigns'.reset_hunk()
end, { desc = 'Reset git hunk' })
map('n', '<leader>gr', function()
  require 'gitsigns'.reset_buffer()
end, { desc = 'Reset git buffer' })
map('n', '<leader>gs', function()
  require 'gitsigns'.stage_hunk()
end, { desc = 'Stage git hunk' })
map('n', '<leader>gu', function()
  require 'gitsigns'.undo_stage_hunk()
end, { desc = 'Unstage git hunk' })
map('n', '<leader>gd', function()
  require 'gitsigns'.diffthis()
end, { desc = 'View git diff' })

-- Go to link/file
map('n', 'gx', function()
  vim.ui.open(vim.fn.expand('<cfile>'))
end, { desc = 'Open file' })
