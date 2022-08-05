-- GLOBALS
vim.g.mapleader = ","

-- Notifications
vim.notify = require('notify')

-- OPTIONS
require('options')

-- BEGIN
require('plugmgr')
require('conf.keymaps')
