return {

  { "rafamadriz/neon", lazy = true },

  -- { "christianchiarulli/nvcode-color-schemes.vim" },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = true,
    opts = {},
  },

  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = true,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    lazy = true,
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },

  {
    "glepnir/zephyr-nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "rockerBOO/boo-colorscheme-nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "jim-at-jibba/ariake-vim-colors",
    priority = 1000,
    lazy = true,
  },

  {
    "sainnhe/edge",
    priority = 1000,
    lazy = true,
    config = function()
      vim.g.edge_style = 'neon'
      vim.edge_better_performance = 1
    end
  },

  {
    "Th3Whit3Wolf/one-nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "yonlu/omni.vim",
    priority = 1000,
    lazy = true,
  },

  {
    'AlexvZyl/nordic.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require 'nordic'.load()
    end
  },

  {
    "rose-pine/neovim",
    priority = 1000,
    lazy = true,
  },

  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = true,
  },

  {
    'NTBBloodbath/doom-one.nvim',
    priority = 1000,
    lazy = true,
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
    priority = 1000,
    lazy = true,
    opts = {},
    -- Optional; default configuration will be used if setup isn't called.
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    priority = 1000,
    lazy = true,
  },

  {
    "frenzyexists/aquarium-vim",
    priority = 1000,
    lazy = true,
  },

  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    'Everblush/nvim',
    name = 'everblush',
    priority = 1000,
    lazy = true,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "rmehri01/onenord.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "titanzero/zephyrium",
    priority = 1000,
    lazy = true,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "ray-x/starry.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "ray-x/aurora",
    priority = 1000,
    lazy = true,
  },

  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "main",
    priority = 1000,
    lazy = true,
  },

  {
    "yazeed1s/minimal.nvim",
    priority = 1000,
    lazy = true,
  },


  {
    "Yazeed1s/oh-lucy.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "nyngwang/nvimgelion",
    priority = 1000,
    lazy = true,
  },

  {
    {
      'maxmx03/fluoromachine.nvim',
      name = "fluoromachine",
      priority = 1000,
      lazy = true,
      opts = {
        -- HAS: retrowave, fluoromachine, delta
        theme = "fluoromachine"
      }
    }
  },

  {
    "sekke276/dark_flat.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "zootedb0t/citruszest.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "2nthony/vitesse.nvim",
    priority = 1000,
    lazy = true,
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
  },

  {
    "kvrohit/mellow.nvim",
    priority = 1000,
    lazy = true,
  },

  {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = true,
    config = function()
      require('ayu').setup({
        mirage = true
      })
    end
  },

  {
    "lunarvim/lunar.nvim",
    priority = 1000,
    lazy = true,
    opts = {},
  },

}
