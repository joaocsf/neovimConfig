local ok, telescope = pcall(require, 'telescope')
if ok then
  local actions = require 'telescope.actions'
  local lga_actions = require("telescope-live-grep-args.actions")

  local code_actions_opts = {
    winblend = 15,
    layout_config = {
      prompt_position = 'top',
      width = 0.8,
      height = 0.9
    }
  }

  local mappings = {}

  local ok_trouble, trouble = pcall(require, 'trouble.sources.telescope')
  if ok_trouble then
    mappings = {
      i = {
        ['<C-s>'] = actions.select_horizontal,
        ['<C-x>'] = trouble.open,
        ['<C-h>'] = 'which_key'
      },
      n = {
        ['<C-x>'] = trouble.open,
        ['<C-s>'] = actions.select_horizontal
      },
    }
  end

  mappings['i']["<C-k>"] = lga_actions.quote_prompt()
  mappings['i']["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " })
  mappings['i']["<C-space>"] = lga_actions.to_fuzzy_refine

  telescope.setup {
    defaults = {
      mappings = mappings,
      layout_strategy = 'vertical',
      layout_config = {
        bottom_pane = {
          height = 25,
          preview_cutoff = 120,
          prompt_position = 'top'
        },
        center = {
          height = 0.4,
          preview_cutoff = 40,
          prompt_position = 'top',
          width = 0.5
        },
        cursor = {
          height = 0.9,
          preview_cutoff = 40,
          width = 0.8
        },
        horizontal = {
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = 'bottom',
          width = 0.8
        },
        vertical = {
          height = 0.9,
          preview_cutoff = 40,
          prompt_position = 'bottom',
          width = 0.8
        }
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      live_grep_args = {
        auto_quoting = true
      },
      ['ui-select'] = {
        require 'telescope.themes'.get_dropdown(code_actions_opts)
      }
    }
  }

  telescope.load_extension 'fzf'
  telescope.load_extension 'live_grep_args'
  telescope.load_extension 'ui-select'
end
