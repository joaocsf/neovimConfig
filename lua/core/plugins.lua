local function conf(cfg)
  return function()
    local module = string.format('configs.%s', cfg)
    local ok, err = pcall(require, module)
    if not ok then
      print("Failed to load: '" .. module .. "' Error:" .. err)
    end
  end
end

local plugins = {
  -- Themes
  { 'morhetz/gruvbox',                  lazy = false,   priority = 1000 },
  { 'nyoom-engineering/oxocarbon.nvim', priority = 1000 },
  { 'Yazeed1s/oh-lucy.nvim',            priority = 1000 },
  { 'marko-cerovac/material.nvim',      priority = 1000 },
  { 'sainnhe/gruvbox-material',         lazy = false,   priority = 1000 },
  { 'EdenEast/nightfox.nvim',           priority = 1000 },
  { 'sainnhe/edge',                     priority = 1000 },
  { 'savq/melange',                     priority = 1000 },
  { 'sainnhe/sonokai',                  priority = 1000 },
  { 'sainnhe/everforest',               priority = 1000 },
  { 'rebelot/kanagawa.nvim',            priority = 1000 },
  { 'folke/tokyonight.nvim',            priority = 1000 },
  { 'lvim-tech/lvim-colorscheme',       priority = 1000 },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = conf 'catppuccin',
    priority = 1000
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = conf 'todo-comments',
    priority = 1000
  },

  -- LSPs/DAPS
  'nvim-neotest/nvim-nio',

  -- LSPs/DAPS
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'neovim/nvim-lspconfig',
    },
    build = ':MasonUpdate',
    config = conf 'mason'
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'ldelossa/nvim-dap-projects'
    },
    config = conf 'nvim-dap'
  },

  -- Misc
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = conf 'telescope'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  'famiu/bufdelete.nvim',

  'nvim-tree/nvim-web-devicons',
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = conf 'bufferline',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = conf 'tree-sitter',
  },
  {
    'MunifTanjim/nui.nvim',
    config = conf 'nui'
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    config = conf 'nvim-surround',
  },

  'mrjones2014/smart-splits.nvim',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = conf 'autopairs',
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
    },
    config = conf 'nvim-cmp',
  },

  {
    'numToStr/Comment.nvim',
    config = conf 'Comment',
  },

  'windwp/nvim-ts-autotag',

  'p00f/nvim-ts-rainbow',

  'wellle/targets.vim',

  {
    'folke/which-key.nvim',
    -- event = "VeryLazy",
    config = conf 'which-key',
    dependencies = {
      'echasnovski/mini.icons',
      'nvim-tree/nvim-web-devicons',
    },
    -- keys = {
    --   {
    --     "<leader>?",
    --     function()
    --       require("which-key").show({ global = false })
    --     end,
    --     desc = "Buffer Local Keymaps (which-key)",
    --   },
    -- },
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = conf 'nvim-colorizer'
  },

  'phaazon/hop.nvim',

  'ggandor/lightspeed.nvim',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = conf 'lualine',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns',
  },

  {
    'akinsho/nvim-toggleterm.lua',
    cmd = 'ToggleTerm',
    config = conf 'toggleterm'
  },

  {
    'diepm/vim-rest-console',
    init = conf 'vim-rest-console'
  },

  {
    'rcarriga/nvim-notify',
    init = conf 'nvim-notify'
  },

  'nvim-lua/plenary.nvim',

  {
    'ThePrimeagen/harpoon',
    config = conf 'harpoon'
  },

  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = conf 'diffview'
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = conf 'octo'
  },

  'tpope/vim-fugitive',

  'tpope/vim-rhubarb',

  'ray-x/lsp_signature.nvim',

  {
    'vimwiki/vimwiki',
    init = conf 'vimwiki'
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = conf 'nvim-tree'
  },

  {
    'folke/lsp-colors.nvim',
    config = conf 'lsp-colors'
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = conf 'treesitter-context'
  },

  {
    'onsails/lspkind.nvim',
    config = conf 'lspkind'
  },

  'nvim-treesitter/playground',

  'kyoh86/vim-jsonl',

  'alunny/pegjs-vim',

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown', 'vimwiki' },
  },

  'godlygeek/tabular',

  'rhysd/vim-grammarous',

  {
    'nvimdev/dashboard-nvim',
    config = conf 'dashboard-nvim'
  },

  'nvim-telescope/telescope-symbols.nvim',

  -- Language Specific

  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = conf 'nvim-metals',
  },

  'tpope/vim-liquid',

  'will133/vim-dirdiff',

  {
    'folke/trouble.nvim',
    config = conf 'trouble'
  },

  {
    'stevearc/oil.nvim',
    config = conf 'oil'
  },

  'kchmck/vim-coffee-script',

  'stevearc/vim-arduino',

  'gpanders/vim-medieval',

  {
    'cshuaimin/ssr.nvim',
    config = conf 'ssr'
  },

  'NoahTheDuke/vim-just',

  "rest-nvim/rest.nvim",

  "xiyaowong/transparent.nvim",

  {
    "3rd/image.nvim",
    opts = {}
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  }

}

local opts = {}

require 'lazy'.setup(plugins, opts)
