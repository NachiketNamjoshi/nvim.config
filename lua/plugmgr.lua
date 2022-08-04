return require('packer').startup(function()
	-- packer
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-sensible'

	-- colorscheme
	use 'gruvbox-community/gruvbox'

	use 'nvim-treesitter/nvim-treesitter'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
