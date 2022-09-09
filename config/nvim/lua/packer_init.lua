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
  use 'wbthomason/packer.nvim'

  -- Color Schemes
  use 'navarasu/onedark.nvim'

  -- UI
  use {
    'kyazdani42/nvim-tree.lua', -- File Tree navigator
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }
  use 'nvim-lualine/lualine.nvim' -- Status line at bottom
  use 'romgrk/barbar.nvim' -- Buffer tab bar
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'ray-x/lsp_signature.nvim'

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Editing
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'lewis6991/gitsigns.nvim'
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-fugitive'
  use 'windwp/nvim-autopairs'
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
