vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- self managed packer
  use 'wbthomason/packer.nvim'

  -- !! Plugins !! --
  -- telescope, fuzzy finder and grep
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- which-key to show shortcuts available after e.g. leader key press
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- tree-sitter for parsing and syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	ts_update()
    end
  }

  -- colorscheme --
  use { "catppuccin/nvim", as = "catppuccin" }
 
  -- nvim-tree for file tree -- 
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  -- lua line for status line --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- lsp-zero for cmp, nulls and mason for lsp installation --
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  -- better escape for jk in insert mode to escape --
  use {'jdhao/better-escape.vim', event = 'InsertEnter'}

  -- tabs --
  use 'nvim-tree/nvim-web-devicons'
  use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

  -- null-ls linting -- 
  use {
    "jay-babu/mason-null-ls.nvim",
    requires = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  }

  -- auto pair --
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter",
    event = "InsertEnter",
  }
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
