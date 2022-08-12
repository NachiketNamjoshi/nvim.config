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
}

local reactor_ok, reactor = pcall(require, 'reactor_lualine')
if reactor_ok then
  vim.notify("Loading Reactor Lualine Theme", vim.log.levels.INFO, {
    title = "reactor colorscheme"
  })
  lualine_opts['theme'] = reactor.LualineTheme;
else
  vim.notify("Cannot Load Reactor Lualine Theme", vim.log.levels.ERROR, {
    title = "reactor colorscheme"
  })
  lualine_opts['theme'] = 'gruvbox'
end

lualine.setup {
	options = lualine_opts
}
