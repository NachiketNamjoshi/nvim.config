local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = ""
    }
  }
})

local mason_lsp_ok, lsp_installer = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
  return
end

local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
  return
end

local servers = {
  'jsonls',
  'sumneko_lua',
  'bashls',
  'vimls',
  'dockerls',
  'cssls',
  'html',
  'pyright',
  'rust_analyzer',
  'tsserver',
  'clangd',
  'gopls',
  'phpactor',
  'sqlls',
  'yamlls',
  'texlab',
}

local server_mapping = {
  'json-lsp',
  'lua-language-server',
  'bash-language-server',
  'vim-language-server',
  'dockerfile-language-server',
  'css-lsp',
  'html-lsp',
  'pyright',
  'rust-analyzer',
  'typescript-language-server',
  'clangd',
  'gopls',
  'phpactor',
  'sqlls',
  'yaml-language-server',
  'texlab',
}

lsp_installer.setup({
	ensure_installed = server_mapping,
  automatic_installation = true,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.lspsetup").on_attach,
		capabilities = require("lsp.lspsetup").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
