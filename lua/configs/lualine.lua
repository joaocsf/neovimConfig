local ok, lualine = pcall(require, 'lualine')


local metals_status = {
  'g:metals_status',
  draw_empty = false,
  cond = function() return vim.g['metals_status'] ~= nil end,
  color = { fg = 'yellow', gui = 'bold' }
}

if ok then
  lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = { 'NvimTree', 'dap-repl', 'dapui_console', 'dapui_watches', 'dapui_stacks',
          'dapui_breakpoints', 'dapui_scopes' },
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { metals_status },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'lsp_status' }
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { metals_status },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'lsp_status' }
    },
    extensions = { 'fugitive', 'nvim-tree', 'quickfix', 'nvim-dap-ui' }
  }
end
