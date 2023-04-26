-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local function conf(cfg)
  return string.format('require"configs.%s"', cfg)
end

local function plugins(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'morhetz/gruvbox'

  use 'nyoom-engineering/oxocarbon.nvim'

  use 'Yazeed1s/oh-lucy.nvim'

  use 'marko-cerovac/material.nvim'

  use 'sainnhe/gruvbox-material'

  use 'EdenEast/nightfox.nvim'

  use 'savq/melange'

  use 'sainnhe/edge'

  use 'sainnhe/sonokai'

  use 'sainnhe/everforest'

  use 'rebelot/kanagawa.nvim'

  use 'folke/tokyonight.nvim'

  -- LSPs/DAPS
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'neovim/nvim-lspconfig',
    },
    run = ':MasonUpdate',
    config = conf 'mason'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' }
    },
    config = conf 'telescope'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use 'famiu/bufdelete.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = conf 'bufferline',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = conf 'tree-sitter',
  }

  use { 'MunifTanjim/nui.nvim',
    config = conf 'nui'
  }

  use {
    'machakann/vim-sandwich',
    config = conf 'vim-sandwich',
  }

  use 'mrjones2014/smart-splits.nvim'

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = conf 'autopairs',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
    },
    config = conf 'nvim-cmp',
  }

  use {
    'numToStr/Comment.nvim',
    config = conf 'Comment',
  }

  use 'windwp/nvim-ts-autotag'

  use 'p00f/nvim-ts-rainbow'

  use 'wellle/targets.vim'

  use { 'folke/which-key.nvim',
    config = conf 'which-key'
  }

  use { 'norcalli/nvim-colorizer.lua',
    config = conf 'nvim-colorizer'
  }

  use 'phaazon/hop.nvim'

  use {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = conf 'null-ls'
  }

  use 'ggandor/lightspeed.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = conf 'lualine',
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = conf 'gitsigns',
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    cmd = 'ToggleTerm',
    module = { 'toggleterm', 'toggleterm.terminal' },
    config = conf 'toggleterm'
  }

  use {
    'diepm/vim-rest-console',
    setup = conf 'vim-rest-console'
  }

  use { 'rcarriga/nvim-notify',
    setup = conf 'nvim-notify'
  }

  use 'nvim-lua/plenary.nvim'

  use { 'ThePrimeagen/harpoon',
    config = conf 'harpoon'
  }

  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = conf 'diffview'
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = conf 'octo'
  }

  use 'tpope/vim-fugitive'

  use 'tpope/vim-rhubarb'

  use 'ray-x/lsp_signature.nvim'

  use {
    'vimwiki/vimwiki',
    config = conf 'vimwiki'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly',
    config = conf 'nvim-tree'
  }

  use {
    'SmiteshP/nvim-navic',
    requires = 'neovim/nvim-lspconfig',
    config = conf 'nvim-navic'
  }

  use {
    'folke/lsp-colors.nvim',
    config = conf 'lsp-colors'
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = conf 'treesitter-context'
  }

  use { 'onsails/lspkind.nvim',
    config = conf 'lspkind'
  }

  use 'nvim-treesitter/playground'

  use 'kyoh86/vim-jsonl'

  use 'alunny/pegjs-vim'

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown', 'vimwiki' },
  }

  use 'godlygeek/tabular'

  use 'rhysd/vim-grammarous'

  use {
    'nvimdev/dashboard-nvim',
    config = conf 'dashboard-nvim'
  }

  use 'nvim-telescope/telescope-symbols.nvim'

  -- Language Specific
  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = conf 'nvim-metals',
  }
end

return require 'packer'.startup {
  plugins,
  config = {
    display = {
      open_fn = require 'packer.util'.float,
    }
  }
}
