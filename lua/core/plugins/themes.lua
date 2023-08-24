return {

  { "rafamadriz/neon" },

  -- { "christianchiarulli/nvcode-color-schemes.vim" },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  { "sainnhe/sonokai" },

  {
    "nyoom-engineering/oxocarbon.nvim"
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },

  { "glepnir/zephyr-nvim" },

  { "rockerBOO/boo-colorscheme-nvim" },

  { "jim-at-jibba/ariake-vim-colors" },

  {
    "sainnhe/edge",
    config = function(...)
      vim.g.edge_style = 'neon'
      vim.edge_better_performance = 1
    end
  },

  { "Th3Whit3Wolf/one-nvim" },

  { "yonlu/omni.vim" },

  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },

  { "rose-pine/neovim" },

  { "Mofiqul/dracula.nvim" },

  { "projekt0n/github-nvim-theme" },

  {
    'NTBBloodbath/doom-one.nvim',
    setup = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = false
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable italic comments
      vim.g.doom_one_italic_comments = false
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false
      -- Enable transparent background
      vim.g.doom_one_transparent_background = false

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = false
    end,
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },

  { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },

  { "frenzyexists/aquarium-vim" },

  { "EdenEast/nightfox.nvim" },

  { 'Everblush/nvim',           name = 'everblush' },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  { "rmehri01/onenord.nvim" },

  { "titanzero/zephyrium" },

  { "rebelot/kanagawa.nvim" },

  { "ray-x/starry.nvim" },

  { "ray-x/aurora" },

  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
  },

  { "yazeed1s/minimal.nvim" },


  { "Yazeed1s/oh-lucy.nvim" },

  { "nyngwang/nvimgelion" },

  {
    {
      'maxmx03/fluoromachine.nvim',
      opts = {
        -- HAS: retrowave, fluoromachine, delta
        theme = "fluoromachine"
      }
    }
  },

  { "sekke276/dark_flat.nvim" },

  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
  },

  { "kvrohit/mellow.nvim" },

  {
    "Shatur/neovim-ayu",
    config = function()
      require('ayu').setup({
        mirage = true
      })
    end
  },

  { "lunarvim/lunar.nvim", opts = {} },

}
