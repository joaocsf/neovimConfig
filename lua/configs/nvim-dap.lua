local ok_dap, dap = pcall(require, 'dap')
local ok_dapui, dapui = pcall(require, 'dapui')
local ok_dapvt, dapvt = pcall(require, 'nvim-dap-virtual-text')

if ok_dap and ok_dapui and ok_dapvt then
  local dap_ui_widgets = require 'dap.ui.widgets'

  -- Mappings
  vim.keymap.set('n', '<F1>', function() dap.continue() end,
    { desc = 'Continue' })
  vim.keymap.set('n', '<Leader>d1', function() dap.continue() end,
    { desc = 'Continue' })
  vim.keymap.set('n', '<F2>', function() dap.step_over() end,
    { desc = 'Step Over' })
  vim.keymap.set('n', '<Leader>d2', function() dap.step_over() end,
    { desc = 'Step Over' })
  vim.keymap.set('n', '<F3>', function() dap.step_into() end,
    { desc = 'Step Into' })
  vim.keymap.set('n', '<Leader>d3', function() dap.step_into() end,
    { desc = 'Step Into' })
  vim.keymap.set('n', '<F4>', function() dap.step_out() end,
    { desc = 'Step Out' })
  vim.keymap.set('n', '<Leader>d4', function() dap.step_out() end,
    { desc = 'Step Out' })
  vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end,
    { desc = 'Toggle Breakpoint' })
  vim.keymap.set('n', '<Leader>dc', function() dap.set_breakpoint(vim.fn.input 'Breakpoint Condition:') end,
    { desc = 'Set Breakpoint' })
  vim.keymap.set('n', '<Leader>dq', function() dap.close() end,
    { desc = 'Close' })
  vim.keymap.set('n', '<Leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ') end,
    { desc = 'Log point message' })
  vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end,
    { desc = 'Open Repl' })
  vim.keymap.set('n', '<Leader>dL', function() dap.run_last() end,
    { desc = 'Run Last' })
  vim.keymap.set({ 'n', 'v' }, '<Leader>du', function() dapui.toggle() end,
    { desc = 'Toggle UI' })
  vim.keymap.set('n', '<Leader>de', function()
      dapui.eval()
      dapui.eval()
    end,
    { desc = 'Evaluate value' })
  vim.keymap.set('n', '<Leader>df', function()
      dapui.float_element('stacks')
      dapui.float_element('stacks')
    end,
    { desc = 'Stacks/Frames' })
  vim.keymap.set('n', '<Leader>ds', function()
      dapui.float_element('scopes')
      dapui.float_element('scopes')
    end,
    { desc = 'Scopes' })
  vim.keymap.set('n', '<Leader>dw', function()
      dapui.float_element('watches')
      dapui.float_element('watches')
    end,
    { desc = 'Watches' })
  vim.keymap.set('n', '<Leader>dB', function()
      dapui.float_element('breakpoints')
      dapui.float_element('breakpoints')
    end,
    { desc = 'Breakpoints' })

  -- Setup dapui and dap virtual text
  dapui.setup()
  dapvt.setup {}

  -- Automatically open dapui
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
  end

  require 'configs.dap'
  require 'nvim-dap-projects'.search_project_config()

  vim.fn.sign_define('DapBreakpoint',          { text = '⬤ ', texthl = 'red', linehl = '', numhl = '' })
  vim.fn.sign_define('DapBreakpointCondition', { text = '⦿ ', texthl = 'orange', linehl = '', numhl = '' })
  vim.fn.sign_define('DapLogPoint',            { text = '⬤ ', texthl = 'blue', linehl = '', numhl = '' })
  vim.fn.sign_define('DapStopped',             { text = '➡ ', texthl = 'blue', linehl = '', numhl = '' })
  vim.fn.sign_define('DapBreakpointRejected',  { text = ' ', texthl = 'red', linehl = '', numhl = '' })
end
