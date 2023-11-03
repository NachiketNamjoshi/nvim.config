-- GLOBALS
vim.g.mapleader = ","
vim.loader.enable()

-- BEGIN
require('plugmgr')
require('conf.keymaps')
require('lsp')

-- Notifications
vim.notify = require('notify')


-- OPTIONS
require('options')
