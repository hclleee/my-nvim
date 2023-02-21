local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  } print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'mhartington/oceanic-next'
  use 'shaunsingh/moonlight.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/everforest'
  use 'tjdevries/colorbuddy.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    cmd = 'Telescope',
  }
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    requires = {
      { 'josa42/coc-go', run = 'yarn install --frozen-lockfile' },
      { 'josa42/coc-lua', run = 'yarn install --frozen-lockfile' },
      { 'fannheyward/telescope-coc.nvim' },
    }
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'tamton-aquib/staline.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use 'lukas-reineke/indent-blankline.nvim'
end,
config = {
  display = {
    open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
