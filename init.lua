-- GLOBALS
vim.g.mapleader = ","

-- BEGIN
require('plugmgr')
require('conf.keymaps')

-- Notifications
vim.notify = require('notify')

-- OPTIONS
require('options')

