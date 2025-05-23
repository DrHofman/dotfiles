return {
  {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v4.x',
      lazy = true,
      config = false,
    },
    {
      'williamboman/mason.nvim',
      lazy = false,
      config = true,
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
      },
      config = function()
        local luasnip = require("luasnip")
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          },
          mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                if luasnip.expandable() then
                  luasnip.expand()
                else
                  cmp.confirm({
                    select = true,
                  })
                end
              else
                fallback()
              end
            end),

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
          },
          snippet = {
            expand = function(args)
              vim.snippet.expand(args.body)
            end,
          },
        })
      end
    },

    { -- LSP
      'neovim/nvim-lspconfig',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
      },
      config = function()
        local lsp_zero = require('lsp-zero')

        -- lsp_attach is where you enable features that only work
        -- if there is a language server active in the file
        local lsp_attach = function(client, bufnr)
          local opts = { buffer = bufnr }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end

        lsp_zero.extend_lspconfig({
          sign_text = true,
          lsp_attach = lsp_attach,
          capabilities = require('cmp_nvim_lsp').default_capabilities()
        })

        require('mason-lspconfig').setup({
          ensure_installed = {
            'ts_ls',
            'eslint',
            'lua_ls',
            'solargraph',
            'intelephense',
            'marksman',
            'dockerls',
            'bashls',
          },
          handlers = {
            -- this first function is the "default handler"
            -- it applies to every language server without a "custom handler"
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
            intelephense = function()
              local stubs = require('config/intelephense')
              require("lspconfig").intelephense.setup({
                settings = {
                  intelephense = {
                    stubs = stubs,
                  },
                },
              })
            end,
          }
        })

        local prettier = {
          formatCommand = "prettierd ${INPUT}",
          formatStdin = true,
          env = {
            string.format("PRETTIERD_DEFAULT_CONFIG=%s",
              vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")),
          },
        }

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim', 'redis', 'ARGV', 'KEYS' }
              }
            }
          }
        })

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
            -- Add other filetypes here if needed
          }
        })
      end
    }
  },
}
