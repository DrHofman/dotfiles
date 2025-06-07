local mason_options = {
  ensure_installed = {
    'bashls',
    'cssls',
    'dockerls',
    'eslint',
    'intelephense',
    'lua_ls',
    'marksman',
    'pyright',
    'ruff',
    'rust_analyzer',
    'solargraph',
    'ts_ls',
    'efm',
  },
}

local default_lspconfig = function(capabilities)
  return {
    on_attach = function()
      local opts = {}
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
    capabilities = capabilities,
  }
end

-- lspconfig
return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local masonLspconfig = require('mason-lspconfig')
      local lspconfig = require('lspconfig')
      local stubs = require('config/intelephense')
      local prettier = {
        formatCommand = "prettierd ${INPUT}",
        formatStdin = true,
        env = {
          string.format("PRETTIERD_DEFAULT_CONFIG=%s",
            vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")),
        },
      }

      lspconfig.efm.setup({
        init_options = { documentFormatting = true },
        settings = {
          rootMarkers = { ".git/" },
          languages = {
            javascript = { prettier },
            typescript = { prettier },
            javascriptreact = { prettier },
            typescriptreact = { prettier },
            json = { prettier },
            css = { prettier },
            html = { prettier },
            php = { prettier },
            -- Add other languages here if needed
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "json",
          "css",
          "html"
        }
      })

      for _, server in pairs(mason_options.ensure_installed) do
        if server == 'ts_ls' then
          lspconfig['ts_ls'].setup({
            on_attach = default_lspconfig(capabilities).on_attach,
            capabilities = default_lspconfig(capabilities).capabilities,
            settings = {
              tsserver = {
                filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
              },
            },
          })
        elseif server == 'solargraph' then
          lspconfig['solargraph'].setup({
            on_attach = default_lspconfig(capabilities).on_attach,
            capabilities = default_lspconfig(capabilities).capabilities,
          })
        elseif server == 'lua_ls' then
          lspconfig['lua_ls'].setup({
            on_attach = default_lspconfig(capabilities).on_attach,
            capabilities = default_lspconfig(capabilities).capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
                workspace = {
                  checkThirdParty = false,
                },
              },
            },
          })
        elseif server == 'intelephense' then
          lspconfig['intelephense'].setup({
            on_attach = default_lspconfig(capabilities).on_attach,
            capabilities = default_lspconfig(capabilities).capabilities,
            settings = {
              intelephense = {
                stubs = stubs,
              },
            },
          })
        else
          lspconfig[server].setup(default_lspconfig(capabilities))
        end
      end

      masonLspconfig.setup({
        ensure_installed = mason_options.ensure_installed,
        automatic_enable = {
          exclude = {
            "rust_analyzer",
            "ts_ls"
          }
        }
      })
    end,
  },
}
