local settings = require("global_option")
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- event = { "BufReadPost", "BufNewFile" },
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "mfussenegger/nvim-ts-hint-textobject",
      "windwp/nvim-ts-autotag",
      -- "nvim-treesitter/playground",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = settings.treesitter_ensure_installed,
        sync_install = true,
        auto_install = true,
        ignore_install = {},

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
          },
        },
        endwise = {
          enable = true,
        },
        indent = { enable = true },
        autopairs = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",
              ["ir"] = "@parameter.inner",
              ["ar"] = "@parameter.outer",
            },
          },
        },
        context_commentstring = { enable = true },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "InsertEnter" },
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    },
    opts = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "glimmer",
        "handlebars",
        "hbs",
      },
    },
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
    },
    cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
}
