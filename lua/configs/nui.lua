local ok_input, Input = pcall(require, 'nui.input')
local ok_autocmd, autocmd = pcall(require, 'nui.utils.autocmd')

if ok_input and ok_autocmd then
  local event = autocmd.event

  local function override_ui_input()
    local input_ui

    vim.ui.input = function(opts, on_confirm)
      if input_ui then
        -- ensure single ui.input operation
        vim.api.nvim_echo({ { 'busy: another input is pending!', 'ErrorMsg' } }, true, {})
        return
      end

      local function on_done(value)
        if input_ui then
          -- if it's still mounted, unmount it
          input_ui:unmount()
        end
        -- pass the input value
        on_confirm(value)
        -- indicate the operation is done
        input_ui = nil
      end

      local border_top_text = opts.prompt or '[Input]'
      local default_value = opts.default

      input_ui = Input({
        relative = 'cursor',
        position = {
          row = 1,
          col = 0,
        },
        size = {
          -- minimum width 20
          width = math.max(20, type(default_value) == 'string' and #default_value or 0),
        },
        border = {
          style = 'rounded',
          highlight = 'Normal',
          text = {
            top = border_top_text,
            top_align = 'left',
          },
        },
        win_options = {
          winhighlight = 'Normal:Normal',
        },
      }, {
        default_value = default_value,
        on_close = function()
          on_done(nil)
        end,
        on_submit = function(value)
          on_done(value)
        end,
      })

      input_ui:mount()

      -- cancel operation if cursor leaves input
      input_ui:on(event.BufLeave, function()
        on_done(nil)
      end, { once = true })

      -- cancel operation if <Esc> is pressed
      input_ui:map('n', '<Esc>', function()
        on_done(nil)
      end, { noremap = true, nowait = true })
    end
  end

  override_ui_input()
end
