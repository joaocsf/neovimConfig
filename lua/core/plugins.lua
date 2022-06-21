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

  use 'sainnhe/gruvbox-material'

  use 'EdenEast/nightfox.nvim'

  use 'savq/melange'

  use 'sainnhe/sonokai'

  use 'sainnhe/everforest'

  use 'folke/tokyonight.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = conf 'telescope'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
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

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = conf 'indent-blankline',
  }

  use 'mrjones2014/smart-splits.nvim'

  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = conf 'autopairs',
  }

  use 'neovim/nvim-lspconfig'

  use {
    'williamboman/nvim-lsp-installer',
    config = conf 'nvim-lsp-installer',
  }

  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = conf 'nvim-metals',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      -- 'hrsh7th/cmp-nvim-lsp-signature-help',
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
    'feline-nvim/feline.nvim',
    config = conf 'feline',
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
    'stevearc/aerial.nvim',
    config = conf 'aerial'
  }

  use {
    'NTBBloodbath/rest.nvim',
    ft = { 'http' },
    requires = { 'nvim-lua/plenary.nvim' },
    config = conf 'rest'
  }

  use 'rcarriga/nvim-notify'

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

  use 'vimwiki/vimwiki'

  use {
    'kyazdani42/nvim-tree.lua',
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

end

return require 'packer'.startup {
  plugins,
  config = {
    display = {
      open_fn = require 'packer.util'.float,
    }
  }
}
