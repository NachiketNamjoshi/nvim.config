local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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
keymap("n", "<leader>rn", "<Plug>(coc-rename)", opts)

-- Tab completion
vim.keymap.set("i", "<TAB>", function()
    if vim.fn['coc#pum#visible']() == 1 then
    vim.fn['coc#pum#next'](1)
  elseif CheckBackSpace() then
    return '<Tab>'
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
  return vim.cmd[[
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  ]]
end

