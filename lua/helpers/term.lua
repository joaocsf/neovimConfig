local M = {}
local T = require'toggleterm.terminal'.Terminal

local lazygit = T:new{ cmd = 'lazygit', hidden = true}

function M.lazygit_toggle()
  lazygit:toggle()
end

return M
