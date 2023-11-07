return {
  -- Language
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'lervag/vimtex',

  -- Navigation
  {
    'mg979/vim-visual-multi',
    lazy = false,
  },
  {
    'tpope/vim-commentary',
    lazy = false
  },

  -- Color
  "ziontee113/color-picker.nvim",
  'gruvbox-community/gruvbox',
  { 'NachiketNamjoshi/reactor.nvim', build = './install.sh' },


  -- Notifications
  'rcarriga/nvim-notify',

  -- Buffers as Tabs
  'romgrk/barbar.nvim',

}
