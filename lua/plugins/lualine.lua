  -- Status Line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
  event = 'BufEnter',
  opts = {
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
}
