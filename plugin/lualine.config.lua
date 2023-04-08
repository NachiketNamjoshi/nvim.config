local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local lualine_opts = {
	icons_enabled = true,
	always_divide_middle = true,
	refresh = {
		statusline = 1000,
		tabline = 1000,
		winbar = 1000,
	},
  section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' },
  theme = "gruvbox"
}

lualine.setup {
	options = lualine_opts
}
