-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'folke/tokyonight.nvim' --Theme

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- Allows for colors and things

  use('theprimeagen/harpoon') -- Ability to make hooks and move around

  use('mbbill/undotree')
  use('tpope/vim-fugitive') -- Git things

  use("windwp/nvim-autopairs")
  use('windwp/nvim-ts-autotag')
  use('mrjones2014/nvim-ts-rainbow') -- rainbow brackets

  use { 'nvim-telescope/telescope-file-browser.nvim', -- File Browser
    requires = {
      'nvim-tree/nvim-web-devicons', -- icons
    }
  }

  use { -- File Sidebar
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    'nvim-lualine/lualine.nvim', -- bottom bar
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true,
    }
  }

  use('github/copilot.vim') --github copilot

  use('tpope/vim-surround') -- Adds surround things
  use('terrortylor/nvim-comment') -- Comment
  require('nvim_comment').setup()

  use('lukas-reineke/indent-blankline.nvim') --For blue jay lines for functions

  use('RRethy/vim-illuminate') -- Highlights things under cursor
  -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'} -- Add better Tabing around

  use('norcalli/nvim-colorizer.lua') -- Colorizes over hex codes

  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    -- run the setup function after plugin is loaded
    config = function()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end
  }


  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional
      { 'onsails/lspkind.nvim' }, -- Optional Icons on autoComplete

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
      { 'nvim-lua/plenary.nvim' }, -- Optional snip for telescope-file-browser

    }
  }

end)
