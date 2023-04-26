require 'helpers.path'

local adapters = {}

for _, adapter in ipairs(Path_Sources 'configs/dap/adapters') do
  if adapter ~= 'init' then
    adapters[adapter] = require('configs.dap.adapters.' .. adapter)
  end
end

return adapters
