return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/luasnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets"
  },
  config = function()
    local cmp = require "cmp"

    require "luasnip.loaders.from_vscode".lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
      }, {
        { name = 'buffer' },
      })
    })
  end
}
