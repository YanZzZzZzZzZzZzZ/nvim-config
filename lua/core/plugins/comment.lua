M = {}


M[#M + 1] = {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}

M[#M + 1] = {
  'numToStr/Comment.nvim',
  opts = {
    mapping = false,
    -- add any options here
  },
  lazy = false,
}

M[#M + 1] = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

M[#M + 1] = {
  "LudoPinelli/comment-box.nvim",
  opts = {

  }

}


return M
