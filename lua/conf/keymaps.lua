local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Better window navigation
keymap("n", "<c-h>", "<C-w>h", opts)
keymap("n", "<c-j>", "<C-w>j", opts)
keymap("n", "<c-k>", "<C-w>k", opts)
keymap("n", "<c-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)

-- Nvim Tree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- Barbar
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Telescope
keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<C-b>', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<C-f>', '<cmd>Telescope live_grep<cr>', opts)

-- COC
keymap("n", "gd", "<Plug>(coc-definition)", opts)
keymap("n", "gy", "<Plug>(coc-type-definition)", opts)
keymap("n", "gi", "<Plug>(coc-implementation)", opts)
keymap("n", "gr", "<Plug>(coc-reference)", opts)
vim.keymap.set("n", "K", function()
    if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
    return '<Nul>'
  end
  return 'K'
end, opts)

-- Tab completion
vim.keymap.set("i", "<TAB>", function()
    if vim.fn['coc#pum#visible']() == 1 then
    vim.fn['coc#pum#next'](1)
  elseif CheckBackSpace() then
    return '<TAB>'
  else
    vim.fn['coc#refresh']()
  end

end, { silent = true, expr = true })

vim.keymap.set("i", "<S-TAB>", function()
  if vim.fn['coc#pum#visible']() == 1 then
    vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, { silent = true, expr = true })

vim.keymap.set("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    vim.fn['coc#pum#confirm']()
  else
    return '<CR>'
  end
end, { silent = true, expr = true })

vim.keymap.set("i", "<c-space>", function()
  vim.fn['coc#refresh']()
end, { silent = true, expr = true })

--------------
-- Autocmds --
--------------

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd(
  { 'CursorHold' },
  {
    pattern = "*",
    command = "call CocActionAsync('highlight')",
  }
)


----------------------
--Service Functions --
----------------------

function CheckBackSpace()
  local col = vim.fn.col('.') - 1
  if col == 0 then
    local gline = vim.fn.getline('.')[col - 1]
    if gline == nil then
      return true
    end
    return string.match(gline, '%w*%s*')
  end
  return true

--  return vim.cmd[[
--    let col = col('.') - 1
--    !col || getline('.')[col - 1]  =~# '\s'
--  ]]
end

