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
  {
    "ziontee113/color-picker.nvim",
    lazy = false,
  },
  'gruvbox-community/gruvbox',
  { 'NachiketNamjoshi/reactor.nvim', build = './install.sh' },
  -- Better inputs
  {
    'stevearc/dressing.nvim',
    opts = {},
    event = "VimEnter",
  },

  -- Notifications
  'rcarriga/nvim-notify',
}
