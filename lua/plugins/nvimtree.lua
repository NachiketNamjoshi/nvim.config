return {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    cmd = {
      'NvimTreeOpen',
      'NvimTreeClose',
      'NvimTreeToggle',
    },
    config = function()
      local status_ok, nvim_tree = pcall(require, "nvim-tree")
      if not status_ok then
        return
      end

      nvim_tree.setup({
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "",
                unmerged = "",
                renamed = "",
                untracked = "",
                deleted = "",
                ignored = "",
              },
            },
          },
        },
        actions = {
          change_dir = {
            enable = true,
            global = true,
          },
        },
      })

    end
}
