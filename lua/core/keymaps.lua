require 'helpers'
-- keymaps
local map = vim.keymap.set

vim.g.mapleader = ' '

-- Packer
map('n', '<leader>pc', '<cmd>PackerCompile<cr>', { desc = 'Packer Compile' })
map('n', '<leader>pC', '<cmd>PackerClean<cr>', { desc = 'Packer Clean' })
map('n', '<leader>pi', '<cmd>PackerInstall<cr>', { desc = 'Packer Install' })
map('n', '<leader>ps', '<cmd>PackerSync<cr>', { desc = 'Packer Sync' })
map('n', '<leader>pS', '<cmd>PackerStatus<cr>', { desc = 'Packer Status' })
map('n', '<leader>pu', '<cmd>PackerUpdate<cr>', { desc = 'Packer Update' })


-- Neotree
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'NeoTree Toggle' })
map('n', '<leader>o', '<cmd>Neotree focus<cr>', { desc = 'NeoTree Focus' })

-- Buffers
-- bufferdelete
map('n', '<leader>cc', '<cmd>Bdelete<cr>', { desc = 'Close buffer' })
map('n', '<leader>ca', '<cmd>w <bar> %bd <bar> e# <bar> bd# <cr><cr>', { desc = 'Close all buffers' })

-- bufferline
map('n', '<S-k>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer tab' })
map('n', '<S-j>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer tab' })
map('n', '>b', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer tab right' })
map('n', '<b', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer tab left' })
map('n', '<S-l>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move buffer tab right' })
map('n', '<S-h>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move buffer tab left' })

-- REST
map('n', '<C-s>', '<Plug>RestNvim', { desc = 'Send Request', nowait = true, silent = true })
map('n', '<leader>rs', '<Plug>RestNvim', { desc = 'Send Request', nowait = true, silent = true })
map('n', '<leader>rp', '<Plug>RestNvimPreview', { desc = 'Preview Curl', nowait = true, silent = true })
map('n', '<leader>rr', '<Plug>RestNvimLast', { desc = 'Re-run last', nowait = true, silent = true })

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
map('n', '<leader>hl', function()
  require 'harpoon.ui'.toggle_quick_menu()
end, { desc = 'Harpoon List Marks' })

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
map('n', '<leader>fw', function()
  -- require'telescope.builtin'.live_grep()
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

-- Toggle Term
-- Lazygit
map('n', '<leader>gz', function()
  require 'helpers.term'.lazygit_toggle()
end, { desc = 'Lazygit' })

--Toggle Term
map('n', '<C-\\>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle Terminal' })
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
