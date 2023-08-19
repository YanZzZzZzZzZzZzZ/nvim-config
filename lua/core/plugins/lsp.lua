-- local settings = require('global_option')
--
-- local util = require('util')
--
return {
  {
    'neovim/nvim-lspconfig',                   -- Required
    dependencies = {
      { 'williamboman/mason.nvim' },           -- Optional

      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', "<cmd>Glance type_definitions<cr>", opts)
          vim.keymap.set('n', 'gd', "<cmd>Glance definitions<cr>", opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', "<cmd>Glance implementations<cr>", opts)
          vim.keymap.set('n', 'KK', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'gr', "<cmd>Glance references<cr>", opts)

          -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          -- vim.keymap.set('n', 'KK', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          --
          -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          vim.keymap.set('n', '<leader>j', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },

  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "williamboman/mason.nvim",
  --   },
  --   config = function()
  --     require("null-ls").setup({})
  --   end,
  -- },

  {
    "Maan2003/lsp_lines.nvim",
    opts = {},
    config = function()
      require("lsp_lines")
      print('setting diagnostics')
      vim.diagnostic.config({
        virtual_lines = {
          only_current_line = true,
        },
      })
    end
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },

  -- {
  --   "jinzhongjia/LspUI.nvim",
  --   event = "VeryLazy",
  --   branch = "v2",
  --   config = function()
  --     -- require("LspUI").setup({})
  --   end
  -- },

  {
    "dnlhc/glance.nvim",
    config = function()
      require('glance').setup({
        -- your configuration
      })
    end,
  },

  {
    'VidocqH/lsp-lens.nvim',
    opts = {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = {                 -- Enable / Disable specific request
        definition = true,
        references = true,
        implements = true,
      },
      ignore_filetype = {
        "prisma",
      },
    }
  },
}
