require 'helpers.path'

local configurations = {}

for _, config in ipairs(Path_Sources 'configs/dap/configurations') do
  if config ~= 'init' then
    configurations[config] = require('configs.dap.configurations.' .. config)
  end
end

return configurations
