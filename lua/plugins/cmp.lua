local function check_backspace()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'folke/lua-dev.nvim',
  },
  config = function()
    local cmp_ok, cmp = pcall(require, "cmp")
    if not cmp_ok then
      return
    end

    local luasnip_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_ok then
      return
    end

    require("luasnip/loaders/from_vscode").lazy_load()

    -- Converted from here https://github.com/neoclide/coc.nvim#example-vim-configuration
    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "ﯟ",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "כֿ",
      Operator = "",
      TypeParameter = "",
    }


    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = {
        -- Scroll documentation back
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        -- Scroll documentation forward
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        -- Trigger completion
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- Complete with selected item
        ["<CR>"] = cmp.mapping.confirm { select = true },

        -- Use TAB to cycle through completion items
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, current_item)
          current_item.kind = string.format("%s", kind_icons[current_item.kind])
          current_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return current_item
        end
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      },
      window = {
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
    })
  end
}

