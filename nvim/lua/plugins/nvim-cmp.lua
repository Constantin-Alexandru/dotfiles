return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "L3MON4D3/luasnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "chrisgrieser/cmp-nerdfont",
    "kdheepak/cmp-latex-symbols",
    "amarz45/nvim-cmp-fonts",
    "micangl/cmp-vimtex",
    "SergioRibera/cmp-dotenv"
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    require "luasnip.loaders.from_vscode".lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        {
          name = 'fonts',
          option = { space_filter = "-" }
        },
        { name = 'vimtex' },
        { name = "dotenv" }
      }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'emoji' },
        { name = 'latex_symbols' }
      })
    })

    cmp.setup.filetype({ "conf", "config" }, { sources = { { name = "fonts" } } })
  end
}
