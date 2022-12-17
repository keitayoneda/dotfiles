vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --powerfull syntax highlight
    use 'nvim-treesitter/nvim-treesitter'
    --colorscheme
    use 'jacoborus/tender.vim'

    --lsp & completion plugins
    --the lsp&cmp setting file is lua/lsp_conf.lua
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jayp0521/mason-null-ls.nvim'

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
        config = function() require'lualine_conf'end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --markdown preview
    use{
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

    --filer
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
    }

    --git
    use 'tpope/vim-fugitive'

    --comment out
    use 'tpope/vim-commentary'

end)
