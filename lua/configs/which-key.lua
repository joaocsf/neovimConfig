local ok, wk = pcall(require, 'which-key')
if ok then
  ---@diagnostic disable-next-line: missing-fields
  wk.setup {
    plugins = {
      marks = true,       -- shows a list of your marks on ' and `
      registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = true,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
      },
      desc = {
        { '<leader>s', 'Search' },
        { '<leader>g', 'Git' },
        { '<leader>l', 'LSP' },
        { '<leader>w', 'Workspace' },
        { '<leader>d', 'Dap' },
      }
    },
    icons = {
      breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
      separator = '➜', -- symbol used between a key and it's label
      group = '+', -- symbol prepended to a group
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    win = {
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      wo = { winblend = 0 }
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3,                    -- spacing between columns
      align = 'left',                 -- align columns left, center or right
    },
    filter = function(mapping) return true end,
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = {
      { "<auto>",   mode = "nixsotc" },
      { "<leader>", mode = { "n", "v" } },
    },
  }

  wk.add {
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>h", group = "Harpoon" },
    { "<leader>l", group = "LSP" },
    { "<leader>r", group = "Rest" },
    { "<leader>s", group = "Search" },
    { "<leader>t", group = "Terminal" },
    { "<leader>w", group = "Workspace" },
    { "<leader>x", group = "Trouble" },
    { "<leader>d", group = "Debugger" },
    { "<leader>m", group = "Misc" },
  }
end
