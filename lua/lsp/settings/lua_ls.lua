local neodev_ok, neodev = pcall(require, 'neodev')
if neodev_ok then
  neodev.setup({})
  return {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  }
end


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
