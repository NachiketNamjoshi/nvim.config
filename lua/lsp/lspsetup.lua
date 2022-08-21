local MODULE = {}


----------------------------------------
-- Hook nvim-cmp into LS capabilities --
----------------------------------------
local lsp_cmp_ok, lsp_cmp = pcall(require, 'cmp_nvim_lsp')
if lsp_cmp_ok then
  local ls_capabilities = vim.lsp.protocol.make_client_capabilities()
  MODULE.capabilities = lsp_cmp.update_capabilities(ls_capabilities)
end

------------------------
-- Set up LSP keymaps --
------------------------
local function lsp_keymaps(bufnr)
  local opts = {
    noremap = true,
    silent = true,
  }

  -- Go to declaration
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

  -- Go to definition
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

  -- Trigger hover manually.
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  -- Go to impl
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  -- show function signature
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-g>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Show references
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  -- Diagnostics Navigation
  -- Go to previous
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  -- Go to next
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- Open Diagnostics details
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

----------------------
-- Expose on_attach --
----------------------

MODULE.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

--------------------
-- Expose setup() --
--------------------

MODULE.setup = function()
  vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
    }
  })
end


return MODULE;
