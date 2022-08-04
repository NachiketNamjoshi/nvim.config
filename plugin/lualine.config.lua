require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	}
}
