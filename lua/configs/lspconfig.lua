return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'jglasovic/venv-lsp.nvim',
        config = function()
          require('venv-lsp').init()
        end,
      },
    },
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_attach_config', { clear = true }),
        desc = 'LSP actions and Ruff hover disable',
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local opts = { buffer = event.buf }

          if client then
            if client.name == 'ruff' then
              client.server_capabilities.hoverProvider = false
            end
            if client.name == 'pyright' then
              client.server_capabilities.hoverProvider = true
            end

            vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          end
        end,
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'pyright',
          -- 'ruff',
          'ts_ls', 'eslint',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,
          ['pyright'] = function()
            require('lspconfig').pyright.setup {
              filetypes = { "python" },
              settings = {
                pyright = {
                  disableOrganizeImports = true, -- Используем Ruff для организации импортов
                },
                python = {
                  analysis = {
                    ignore = { '*' }, -- Полностью полагаемся на Ruff для диагностики
                  },
                },
              },
            }
          end,
          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup {
              settings = {
                Lua = {
                  runtime = { version = 'LuaJIT' },
                  diagnostics = { globals = { 'vim' } },
                  workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                  telemetry = { enable = false },
                },
              },
            }
          end,
        }
      })
    end,
  },
}
