-- Stolen from :: https://raw.githubusercontent.com/ChristianChiarulli/nvim/master/lua/user/plugins.lua

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugmgr.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

return require('packer').startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- Syntax Highlight
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'p00f/nvim-ts-rainbow'

  -- Language
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'lervag/vimtex'

  -- Navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'mg979/vim-visual-multi'
  use 'tpope/vim-commentary'

  -- Color
  use "NvChad/nvim-colorizer.lua"
  use "ziontee113/color-picker.nvim"
  use 'gruvbox-community/gruvbox'

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- Buffers as Tabs
  use 'romgrk/barbar.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
