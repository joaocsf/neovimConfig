local ok, feline = pcall(require, 'feline')

if ok then

  local lsp = require 'feline.providers.lsp'
  local vi_mode_utils = require 'feline.providers.vi_mode'

  local gps = require 'nvim-gps'

  local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }

  local winbar_components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
  }

  local components = {
    active = { {}, {}, {} },
    inactive = { {}, {}, {} },
  }

  local colors = {
    bg = 'StatusLine',
    fg = 'Normal',
    black = '#282828',
    yellow = '#d8a657',
    cyan = '#89b482',
    oceanblue = '#45707a',
    green = '#a9b665',
    orange = '#e78a4e',
    violet = '#d3869b',
    magenta = '#c14a4a',
    white = '#a89984',
    skyblue = '#7daea3',
    red = '#ea6962',
  }

  local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    CONFIRM = 'red',
    VISUAL = 'skyblue',
    LINES = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
  }

  local vi_mode_text = {
    NORMAL        = 'NORMAL',
    OP            = 'OP',
    INSERT        = 'INSERT',
    VISUAL        = 'VISUAL',
    LINES         = 'LINES',
    BLOCK         = 'BLOCK',
    REPLACE       = 'REPLACE',
    ['V-REPLACE'] = 'V-REPLACE',
    ENTER         = 'ENTER',
    MORE          = 'MORE',
    SELECT        = 'SELECT',
    COMMAND       = 'COMMAND',
    SHELL         = 'SHELL',
    TERM          = 'TERM',
    NONE          = 'NONE',
    CONFIRM       = 'CONFIRM'
  }

  force_inactive.filetypes = {
    'NvimTree',
    'dbui',
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame'
  }

  force_inactive.buftypes = {
    'terminal'
  }

  -- STATUSLINE
  local LEFT = 1
  local MID = 2
  local RIGHT = 3
  -- LEFT
  -- vi-symbol
  table.insert(components.active[LEFT], {
    provider = function()
      return ' ' .. vi_mode_text[vi_mode_utils.get_vim_mode()] .. ' '
    end,
    hl = function()
      local val = {}
      val.fg = 'black'
      val.bg = vi_mode_utils.get_mode_color()
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  })
  -- filename
  table.insert(components.active[LEFT], {
    provider = {
      name = 'file_info',
      opts = {
        type = 'unique',
        file_modified_icon = '',
        file_readonly_icon = ' '
      }
    },
    short_provider = {
      name = 'file_info',
      opts = {
        type = 'unique-short',
        file_modified_icon = '',
        file_readonly_icon = ' '
      }
    },
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    }
  })
  -- MID

  -- gitBranch
  table.insert(components.active[MID], {
    provider = 'git_branch',
    hl = {
      fg = 'yellow',
      bg = 'bg',
      style = 'bold'
    }
  })
  -- diffAdd
  table.insert(components.active[MID], {
    provider = 'git_diff_added',
    hl = {
      fg = 'green',
      bg = 'bg',
      style = 'bold'
    }
  })
  -- diffModfified
  table.insert(components.active[MID], {
    provider = 'git_diff_changed',
    hl = {
      fg = 'orange',
      bg = 'bg',
      style = 'bold'
    }
  })
  -- diffRemove
  table.insert(components.active[MID], {
    provider = 'git_diff_removed',
    hl = {
      fg = 'red',
      bg = 'bg',
      style = 'bold'
    },
  })

  -- RIGHT

  -- fileIcon
  table.insert(components.active[RIGHT], {
    provider = function()
      local filename  = vim.fn.expand '%:t'
      local extension = vim.fn.expand '%:e'
      local icon      = require 'nvim-web-devicons'.get_icon(filename, extension)
      if icon == nil then
        icon = ''
      end
      return icon
    end,
    hl = function()
      local val        = {}
      local filename   = vim.fn.expand '%:t'
      local extension  = vim.fn.expand '%:e'
      local icon, name = require 'nvim-web-devicons'.get_icon(filename, extension)
      if icon ~= nil then
        val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
      else
        val.fg = 'white'
      end
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  })
  -- fileType
  table.insert(components.active[RIGHT], {
    provider = 'file_type',
    hl = function()
      local val        = {}
      local filename   = vim.fn.expand '%:t'
      local extension  = vim.fn.expand '%:e'
      local icon, name = require 'nvim-web-devicons'.get_icon(filename, extension)
      if icon ~= nil then
        val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
      else
        val.fg = 'white'
      end
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  })
  -- fileSize
  table.insert(components.active[RIGHT], {
    provider = 'file_size',
    enabled = function() return vim.fn.getfsize(vim.fn.expand '%:t') > 0 end,
    hl = {
      fg = 'skyblue',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  })
  -- fileFormat
  table.insert(components.active[RIGHT], {
    provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  })
  -- fileEncode
  table.insert(components.active[RIGHT], {
    provider = 'file_encoding',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  })
  table.insert(components.active[RIGHT], {
    provider = 'position',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  })
  -- linePercent
  table.insert(components.active[RIGHT], {
    provider = 'line_percentage',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  })
  -- scrollBar
  table.insert(components.active[RIGHT], {
    provider = 'scroll_bar',
    hl = {
      fg = 'yellow',
      bg = 'bg',
    },
  })

  -- INACTIVE

  -- fileType
  table.insert(components.inactive[LEFT], {
    provider = 'file_type',
    hl = {
      fg = 'black',
      bg = 'cyan',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'cyan'
        }
      },
      ' '
    }
  })

  table.insert(components.inactive[MID], {
    -- provider = function()
    --   return vim.fn.expand '%:F'
    -- end,
    provider = {
      name = 'file_info',
      opts = {
        type = 'unique',
        file_modified_icon = '',
        file_readonly_icon = ' '
      }
    },
    short_provider = {
      name = 'file_info',
      opts = {
        type = 'unique-short',
        file_modified_icon = '',
        file_readonly_icon = ' '
      }
    },
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    }
  })

  -- WINBAR
  -- LEFT

  -- nvimGps
  table.insert(winbar_components.active[LEFT], {
    provider = function() return gps.get_location() end,
    enabled = function() return gps.is_available() end,
    hl = {
      fg = 'orange',
      style = 'bold'
    }
  })

  -- MID

  -- RIGHT

  -- LspName
  table.insert(winbar_components.active[RIGHT], {
    provider = 'lsp_client_names',
    hl = {
      fg = 'yellow',
      style = 'bold'
    },
    right_sep = ' '
  })
  -- diagnosticErrors
  table.insert(winbar_components.active[RIGHT], {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
    hl = {
      fg = 'red',
      style = 'bold'
    }
  })
  -- diagnosticWarn
  table.insert(winbar_components.active[RIGHT], {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
    hl = {
      fg = 'yellow',
      style = 'bold'
    }
  })
  -- diagnosticHint
  table.insert(winbar_components.active[RIGHT], {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
    hl = {
      fg = 'cyan',
      style = 'bold'
    }
  })
  -- diagnosticInfo
  table.insert(winbar_components.active[RIGHT], {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
    hl = {
      fg = 'skyblue',
      style = 'bold'
    }
  })

  -- INACTIVE

  -- fileType
  table.insert(winbar_components.inactive[LEFT], {
    provider = 'file_type',
    hl = {
      fg = 'black',
      bg = 'cyan',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'cyan'
        }
      },
      ' '
    }
  })

  feline.setup {
    theme = colors,
    default_bg = 'bg',
    default_fg = 'fg',
    vi_mode_colors = vi_mode_colors,
    components = components,
    force_inactive = force_inactive,
    disable = {
      filetypes = {
        '^NvimTree$', '^neo%-tree$', '^dashboard$', '^Outline$', '^aerial$'
      },
      buftypes = { 'terminal' }
    }
  }

  feline.winbar.setup {
    components = winbar_components,
    force_inactive = force_inactive,
    disable = {
      buftypes = { 'terminal' }
    }
  }
end
