return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()

    local luasnip = require('luasnip')

    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu = {
            nvim_lsp = '[Lsp]',
            luasnip = '[Snip]',
            buffer = '[Buff]',
            path = '[Path]',
            cmdline = '[Cmd]',
            cmdline_history = '[History]',
          }
          item.menu = menu[entry.source.name]
          return item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<ESC'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp'},
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
    })
  end,
}
