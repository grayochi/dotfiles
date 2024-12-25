return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'stevearc/conform.nvim',
    'mfussenegger/nvim-lint',
  },
  config = function()
    local buf = vim.lsp.buf

    local keymap = vim.keymap.set

    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local mason = require('mason')

    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    local mason_lspconfig = require('mason-lspconfig')

    local lspconfig = require('lspconfig')

    mason_lspconfig.setup({
      automatic_installation = false,
      ensure_installed = {
        'ts_ls',
        'svelte',
        'volar',
        'jsonls',
        'html',
        'cssls',
        'emmet_ls',
        'tailwindcss',
        'graphql',

        'lua_ls',
        'gopls',
        'pyright',

        'dockerls',
        'terraformls'
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              local bufopts = { noremap = true, silent = true, buffer = bufnr }
              keymap('n', 'gt', buf.hover, bufopts)
              keymap('n', 'gD', buf.declaration, bufopts)
              keymap('n', 'gd', ':FzfLua lsp_definitions<CR>', bufopts)
              keymap('n', 'gi', ':FzfLua lsp_implementations<CR>', bufopts)
              keymap('n', 'gT', ':FzfLua lsp_typedefs<CR>', bufopts)
              keymap('n', 'gr', ':FzfLua lsp_references<CR>', bufopts)
              keymap('n', 'gf', buf.format, bufopts)
              keymap('n', '<F2>', buf.rename, bufopts)
            end
            ,
          })
        end,
        ['ts_ls'] = function()
          lspconfig.ts_ls.setup({
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
          })
        end,
        ['lua_ls'] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end,
        ['eslint_d'] = function()
          lspconfig.eslint_d.setup({
            settings = {
              packageManager = 'yarn'
            },
          })
        end,
        ['cssls'] = function()
          lspconfig.cssls.setup({
            settings = {
              css = {
                vaildate = true,
                lint = {
                  unknownAtRules = 'ignore'
                }
              }
            }

          })
        end
      },
    })

    local mason_tool_installer = require('mason-tool-installer')

    mason_tool_installer.setup({
      ensure_installed = {
        'prettier',
        'prettierd',
        'stylua',
        'eslint_d',
      },
    })

    local conform = require('conform')
    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        python = { 'autopep8' },
      },
    }
    keymap('n', 'gf', function()
      conform.format({
        timeout_ms = 1000,
        lsp_format = 'fallback',
      })
    end, {})

    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
      python = { 'pylint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    keymap('n', 'gl', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end
}
