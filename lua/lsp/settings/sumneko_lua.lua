local luadev_ok, luadev = pcall(require, 'lua-dev')
if not luadev_ok then
  return {
	  settings = {
		  Lua = {
			  diagnostics = {
				  globals = { "vim" },
			  },
			  workspace = {
				  library = {
					  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
					  [vim.fn.stdpath("config") .. "/lua"] = true,
				  },
			  },
		  },
	  },
  }
end

return luadev.setup({
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
  }
})
