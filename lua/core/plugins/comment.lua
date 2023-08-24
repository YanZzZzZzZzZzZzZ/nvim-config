local neogen = {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}

local comment = {
  'numToStr/Comment.nvim',
  opts = {
    mapping = false,
    -- add any options here
  },
  lazy = false,
}

local todocomment = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

local commentbox = {
  "LudoPinelli/comment-box.nvim",
  opts = {

  }

}

return {
  neogen,
  comment,
  todocomment,
  commentbox,
}
