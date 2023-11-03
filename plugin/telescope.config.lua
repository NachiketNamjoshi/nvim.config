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

