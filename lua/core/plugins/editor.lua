return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local remap = vim.api.nvim_set_keymap
      local npairs = require('nvim-autopairs')

      npairs.setup({ map_bs = false, map_cr = false })

      vim.g.coq_settings = { keymap = { recommended = false } }

      -- these mappings are coq recommended mappings unrelated to nvim-autopairs
      remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
      remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
      remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
      remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

      -- skip it, if you use another global object
      _G.MUtils = {}

      MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
          else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end
      remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

      MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
          return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end
      remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    end
  },

  { "HiPhish/rainbow-delimiters.nvim" },

  {
    'willothy/moveline.nvim',
    build = 'make',
    config = function()
      local moveline = require('moveline')
      vim.keymap.set('n', '<M-k>', moveline.up)
      vim.keymap.set('n', '<M-j>', moveline.down)
      vim.keymap.set('v', '<M-k>', moveline.block_up)
      vim.keymap.set('v', '<M-j>', moveline.block_down)
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

      -- vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"
      -- vim.opt.listchars:append "eol:↴"

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,

        char_highlight_list = {
          "IndentBlanklineIndent1",
          -- "IndentBlanklineIndent2",
          -- "IndentBlanklineIndent3",
          -- "IndentBlanklineIndent4",
          -- "IndentBlanklineIndent5",
          -- "IndentBlanklineIndent6",
        },
      }
    end
  },

  {
    "mg979/vim-visual-multi",
    event = "BufAdd",
  },

  {
    "simrat39/symbols-outline.nvim",
    opts = {
      -- Depth past which nodes will be folded by default
      autofold_depth = 1,
    },
    keys = {
      { "<leader>tO", "<cmd>SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
    },
  },

}
