return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    lazy = false,
    config = function()
      local ok, telescope = pcall(require, 'telescope')
      if not ok then
        return
      end

      local tactions_ok, actions = pcall(require, 'telescope.actions')
      if not tactions_ok then
        return
      end

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { 'smart' },
        },
        pickers = {
          planets = {
            show_pluto = true,
            show_moon = true,
          },
        },
        mappings = {
          i = {
            ["<C-_>"] = actions.which_key,
          },
          n = {
            ["?"] = actions.which_key,
          },
        },
      })
    end
}
