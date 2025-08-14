local ok, telescope = pcall(require, 'telescope')

local M = {}

function M.filepicker()
  print("File picker not initialized, telescope missing")
end

if ok then
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local conf = require('telescope.config').values
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'

  local function picker_file(opts, callback)
    opts = opts or {}
    pickers.new(opts, {
      prompt_title = "executable",
      finder = finders.new_oneshot_job({ 'find', '-type', 'f', '-executable' }, opts),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          callback(selection and selection[1] or nil)
        end)
        return true
      end,
    }):find()
  end

  function M.filepicker(opts)
    return coroutine.create(function(co)
      picker_file(opts, function(item)
        coroutine.resume(co, item)
      end
      )
    end
    )
  end
end

return M
