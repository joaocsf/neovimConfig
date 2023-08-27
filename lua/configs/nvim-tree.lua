local ok, tree = pcall(require, 'nvim-tree')

local function natural_cmp(l, r)
  if l.type == r.type then
    local a = l.name
    local b = r.name
    local function padnum(d) return ('%03d%s'):format(#d, d) end

    return tostring(a):gsub('%.?%d+', padnum) .. ('%3d'):format(#b)
        < tostring(b):gsub('%.?%d+', padnum) .. ('%3d'):format(#a)
  else
    return l.type < r.type
  end
end

if ok then
  tree.setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    sort_by = function(nodes) table.sort(nodes, natural_cmp) end,
    update_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    view = {
      adaptive_size = true,
      centralize_selection = false,
      width = 30,
      hide_root_folder = false,
      side = 'left',
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
    },
    renderer = {
      add_trailing = false,
      group_empty = true,
      highlight_git = true,
      full_name = false,
      highlight_opened_files = 'none',
      root_folder_modifier = ':~',
      indent_markers = {
        enable = true,
        icons = {
          corner = '└ ',
          edge = '│ ',
          item = '│ ',
          none = '  ',
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = 'after',
        padding = ' ',
        symlink_arrow = ' ➛ ',
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = '',
          symlink = '',
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '➜',
            untracked = '',
            deleted = '',
            ignored = '',
          },
        },
      },
      special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {},
    },
    system_open = {
      cmd = '',
      args = {},
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    filters = {
      dotfiles = false,
      custom = {},
      exclude = {},
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 500,
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 400,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      expand_all = {
        max_folder_discovery = 300,
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
          chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
          exclude = {
            filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
            buftype = { 'nofile', 'terminal', 'help' },
          },
        },
      },
      remove_file = {
        close_window = true,
      },
    },
    trash = {
      cmd = 'gio trash',
      require_confirm = true,
    },
    live_filter = {
      prefix = '[FILTER]: ',
      always_show_folders = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
  } -- END_DEFAULT_OPTS
end
