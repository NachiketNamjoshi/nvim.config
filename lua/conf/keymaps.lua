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
keymap("n", "K", "v:lua.ShowDocumentation()", opts)
keymap("n", "<leader>rn", "<Plug>(coc-rename)", opts)

-- Tab completion
keymap("i", "<TAB>", "v:lua.TabComplete()", { silent = true, expr = true })
keymap("i", "<S-TAB>", "v:lua.PreviousCompletionItem()", { silent = true, expr = true })
keymap("i", "<CR>", "v:lua.SelectCompletion()", { silent = true, expr = true })
keymap("i", "<c-space>", "v:lua.ShowCompletion()", { silent = true, expr = true })

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

function _G.PreviousCompletionItem()
  if vim.fn['coc#pum#visible']() then
    vim.fn['coc#pum#prev'](1)
  else
    vim.cmd[[
      "\<C-h>"
    ]]
  end
end

function _G.ShowCompletion()
  vim.fn['coc#refresh']()
end

function _G.SelectCompletion()
  if vim.fn['coc#pum#visible']() then
    vim.fn['coc#pum#confirm']()
  else
    vim.cmd[[
      "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
    ]]
  end
end

function _G.TabComplete()
  if vim.fn['coc#pum#visible']() then
    vim.fn['coc#pum#next'](1)
  elseif CheckBackSpace() then
    vim.cmd[[\<Tab>]]
  else
    vim.fn['coc#refresh']()
  end
end

function _G.CheckBackSpace()
  return vim.cmd[[
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  ]]
end

function _G.ShowDocumentation()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.fn.feedkeys('K', 'in')
  end
end

