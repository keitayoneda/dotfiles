vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- powerfull syntax highlight
  -- use { 'nvim-treesitter/nvim-treesitter',
  --   config = function() require('nvim-treesitter.configs').setup {
  --       ensure_installed = "all",
  --       auto_install = true,
  --       highlight = {
  --         enable = true
  --       }
  --     }
  --   end }
  --colorscheme
  use 'jacoborus/tender.vim'
  use "ellisonleao/gruvbox.nvim"

  --lsp & completion plugins
  --the lsp&cmp setting file is lua/lsp_conf.lua
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jayp0521/mason-null-ls.nvim'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { ('nvim-lua/plenary.nvim') }
  }
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy'
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'


  --show info in status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'lualine_conf' end,
    requires = { 'nvim-tree/nvim-web-devicons', 'folke/trouble.nvim'
    }
  }

  --markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  --telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function() require('telescope_conf') end,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = function() require('nvim_tree_conf') end,
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  --git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  --comment out
  use 'tpope/vim-commentary'

  --pair bracker
  use 'jiangmiao/auto-pairs'

  --quickrun
  use { "is0n/jaq-nvim", config = function() require 'quickrun_conf' end }

  --texvim
  use { 'lervag/vimtex', config = function() require 'vimtex_conf' end }
  --doxygen
  use { 'vim-scripts/DoxygenToolkit.vim', config = function() require 'doxygen_conf' end }

  --copilot
  use 'github/copilot.vim'
end)
