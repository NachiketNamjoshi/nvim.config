-- GLOBALS
vim.g.mapleader = ","

-- BEGIN
require('plugmgr')
require('conf.keymaps')
require('lsp')

-- Notifications
vim.notify = require('notify')


-- OPTIONS
require('options')
